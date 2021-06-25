export function helloWorld() {
    return 'Hello world!';
}

describe('Hello world', () => {

    let expected = "";

    beforeEach(() => {
        expected = "Hello world!";
    });

    afterEach(() => {
        expected = "";
    });

    it('says hello', () => {
        expect(helloWorld())
            .toEqual(expected);
    });
});