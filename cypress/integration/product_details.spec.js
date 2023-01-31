describe("Product Page", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("navigate to a product's page", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
  });
});
