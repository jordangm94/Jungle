describe('Cypress Home Page', () => {
  
  it('displays the homepage when visiting /', () => {
    cy.visit('/')
  })

  //Since each _product partial renders an article, we are expecting to find at least one on the page
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

})