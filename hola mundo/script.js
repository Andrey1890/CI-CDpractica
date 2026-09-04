(() => {
  const year = new Date().getFullYear();
  const footer = document.querySelector('footer span:last-child');
  if (footer) {
    footer.textContent = `${footer.textContent} · ${year}`;
  }
})();