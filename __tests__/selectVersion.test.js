jest.mock("inquirer");

const { expectPrompts } = require("inquirer");
const mock = require("mock-fs");
const selectVersion = require("../src/selectVersion");

beforeAll(() => {
  mock({
    "package.json": mock.file({
      content: '{"version": "0.0.1"}'
    })
  });
});

afterAll(() => {
  mock.restore();
});

it("should pass", async () => {
  expectPrompts([
    {
      message: "Select release version",
      choices: [
        "patch: 0.0.2",
        "minor: 0.1.0",
        "major: 1.0.0",
        "prepatch: 0.0.2-beta.0",
        "preminor: 0.1.0-beta.0",
        "premajor: 1.0.0-beta.0",
        "prerelease: 0.0.2-beta.0"
      ],
      choose: 3
    }
  ]);
  const answers = await selectVersion();
  expect(answers).toEqual("0.0.2-beta.0");
});
