describe('Clicking add to cart on a product on home page', () => {
  
  it("should increase cart from 0 to 1", () => {
    cy.visit('/')
    cy.contains('My Cart (1)').should('not.exist') //Ensure cart does not have 1 item in it at beginning of test just to be safe
    cy.contains(".btn", "Add")
    .first()
    .click({force: true})
    cy.contains('My Cart (1)').should('exist') //Due to the actions of our test, we now validate that cart has 1 item from us clicking add
  });

})