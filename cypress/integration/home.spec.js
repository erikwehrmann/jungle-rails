describe("HomePage", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("displays page", () => {
    cy.get(".title").should("exist");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
