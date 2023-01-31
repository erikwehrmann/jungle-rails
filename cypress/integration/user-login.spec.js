describe("Signup, Login", () => {
  it("signs up new user", () => {
    cy.visit("/");
    cy.get(".end-0 > .nav-link").click();
    cy.get("#user_first_name").type("Cypress");
    cy.get("#user_last_name").type("Testing");
    cy.get("#user_email").type("test@email.com");
    cy.get("#user_password").type("password");
    cy.get("#user_password_confirmation").type("password");
    cy.get(".btn").click();
    cy.contains("Cypress Testing");
  });
  it("logs user out", () => {
    cy.get(".end-0 > .nav-link").click();
    cy.contains("Login");
  });
  it("logs user in", () => {
    cy.get("#email").type("test@email.com");
    cy.get("#password").type("password");
    cy.get(".btn").click();
    cy.contains("Cypress Testing");
  });
});
