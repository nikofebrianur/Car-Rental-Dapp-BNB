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
        });

        it("adds a new car", async () => {
            await carRental.addCar("Tesla Model S", "car's url", 10, 30000, { from: owner });
            const car = await carRental.getCar(1);
            assert.equal(car.name, "Tesla Model S", "Problem with car name");
            assert.equal(car.imgUrl, "car's url", "Problem with car image URL");
            assert.equal(car.rentFee, 10, "Problem with rent fee");
            assert.equal(car.saleFee, 30000, "Problem with sale fee");
        })
    });
})