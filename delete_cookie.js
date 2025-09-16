// Create an IIFE¹.
(function () {
  try {
    // Predefined cookie name to delete
    const cookieNameToDelete = 'CtxsBrowserCloseToEndSession'; // Change this to the specific cookie name you want to delete
    
    // Get the domain name in order to remove domain-specific cookies
    const domain = window.location.hostname;
    // Get all the cookies set on the document and break 'em up'
    const cookiesList = document.cookie.split(';');
    // Create a new date from right this instant, we'll use this to invalidate the specific cookie.
    const dateToInvalidateBy = new Date().toUTCString();

    // Flag to track if the cookie was found and deleted
    let cookieFound = false;

    cookiesList.forEach((cookie) => {
      // Cookies are set like `cookieName=cookieValue;`, this grabs ONLY the name segment.
      const cookieName = cookie.match(/^(.*?)=/)?.[1]?.trim();
      
      // Only process the cookie if it matches our predefined name
      if (cookieName === cookieNameToDelete) {
        cookieFound = true;
        
        // I found I needed to select cookies that started with __Host
        // and pass them the `secure` flag in order to properly invalidate them.
        if (cookieName.startsWith('__Host-')) {
          // For all cookies, we just tell the document cookie manager that the cookie's value has changed
          // Basically: cookie name has an empty value, expires right now, and has some metadata (path, security, domain, etc)
          document.cookie = `${cookieName}=;expires=${dateToInvalidateBy};path=/;secure`;
        } else {
          document.cookie = `${cookieName}=;expires=${dateToInvalidateBy};path=/`;
          document.cookie = `${cookieName}=;expires=${dateToInvalidateBy};path=/;domain=${domain}`;
        }
      }
    });
    
    if (cookieFound) {
      alert(`Cookie '${cookieNameToDelete}' cleared successfully. Feel free to reload.`);
    } else {
      alert(`Cookie '${cookieNameToDelete}' not found.`);
    }
  } catch (err) {
    alert(`Error clearing cookie: ${err.message}`);
  }
})();
