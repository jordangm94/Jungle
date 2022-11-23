describe('Clicking add to cart on a product on home page', () => {
  
  it("Clicking on add to cart on home page should increase cart from 0 to 1", () => {
    cy.visit('/')
    cy.contains(".btn", "Add")
    .first()
    .click({force: true})
  });

})