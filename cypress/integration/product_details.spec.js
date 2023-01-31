describe('example to-do app', () => {
  it('visit base url', () => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("Users can navigate from the home page to a product page", () => {
    cy.visit('/')
    cy.get(".products article")
      .first()
      .click();
    cy.get(".product-detail").should("be.visible");
  });

  it("should add a product to cart", () => {
    cy.get(".button_to")
      .first()
      .click();
      cy.contains("Add").click();
    });

})
