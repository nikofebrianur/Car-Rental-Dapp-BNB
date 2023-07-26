const CarRental = artifacts.require("CarRental");

contract("CarRental", accounts => {
    let carRental;
    const owner = accounts[0];
    const user1 = accounts[1];

    beforeEach(async () => {
        carRental = await CarRental.new();
    });

    describe("Add user and car", () => {
        it("adds a new user", async () => {
            await carRental.addUser("Alice", "Smith", { from: user1 });
            const user = await carRental.getUser(user1);
            assert.equal(user.name, "Alice", "Problem with user name");
            assert.equal(user.lastName, "Smith", "Problem with user lastname");
        })
    });
})