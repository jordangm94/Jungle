describe('Visiting Product Page', () => {
  
  it("Navigating from home page to products details page", () => {
    cy.visit('/')
    cy.get(".products article")
    .first()
    .click()
    .contains('h1', 'Scented Blade') //Finds the h1 element on show.html.erb that contains product.name
  });

})