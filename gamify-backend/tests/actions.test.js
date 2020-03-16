const { createAction } = require("../service/actionsService");
const { generateUuid } = require("../helper");

const type = generateUuid();
const name = generateUuid();

test("createAction", async () => {
  const response = await createAction(name, 50, type);
  expect(response.id_action).toBe(name);
});
