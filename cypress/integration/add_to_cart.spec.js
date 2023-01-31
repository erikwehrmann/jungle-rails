describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("navigate to a product's page", () => {
    cy.contains('[data-testid="amount-in-cart"]', "0");
    cy.get("[data-testid='add-to-cart-btn']").first().click({ force: true });
    cy.contains('[data-testid="amount-in-cart"]', "1");
  });
});
