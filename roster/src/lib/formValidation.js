// These are helper functions to validate input on various screens

// Styles the color for invalid or valid
const displayInvalid = (input, color) => {
    input.style.borderColor = color;
    input.previousElementSibling.style.color = color;
    input.nextElementSibling.style.color = color;
};
const displayValid = (input) => {
    input.style.borderColor = "";
    input.previousElementSibling.style.color = "";
    input.nextElementSibling.style.color = "";
};

// this checks for a valid email
const invalidEmailMsg = (e) => {
    console.log("e = ", e.target);
    if (e.target.value === "") {
        displayInvalid(e.target, "red");
        e.target.setCustomValidity("Required email address");
    } else if (e.target.validity.patternMismatch) {
        displayInvalid(e.target, "red");
        e.target.setCustomValidity("please enter a valid email address");
    } else {
        e.target.setCustomValidity("");
        displayValid(e.target);
    }
    return true;
};

// this checks to make sure the field is greater than MIN but less than MAX
const invalidMinMaxMsg = (e, min, max) => {
    // debugger;
    console.log(e);
    const fieldName = e.target.nextElementSibling.textContent;
    if (e.target.value === "") {
        e.target.setCustomValidity(`${fieldName} is required`);
        displayInvalid(e.target, "red");
    } else if (e.target.validity.tooShort) {
        e.target.setCustomValidity(
            `${fieldName} needs to be at least ${min} characters long.`
        );
        displayInvalid(e.target, "red");
    } else if (e.target.validity.tooLong) {
        e.target.setCustomValidity(
            `${fieldName} name needs to be between ${min} and ${max} characters long.`
        );
        displayInvalid(e.target, "red");
    } else {
        e.target.setCustomValidity("");
        displayValid(e.target);
    }
    return true;
};

// this checks to make sure that the field is numeric
const invalidNumber = (e, min, max) => {
    const fieldName = e.target.nextElementSibling.textContent;
    if (e.target.value === "") {
        e.target.setCustomValidity(`${fieldName} is required`);
        displayInvalid(e.target, "red");
    } else if (isNaN(e.target.value)) {
        e.target.setCustomValidity(`${fieldName} needs to be Numeric.`);
        displayInvalid(e.target, "red");
    } else if (e.target.validity.tooShort) {
        e.target.setCustomValidity(
            `${fieldName} needs to be ${min} characters long.`
        );
        displayInvalid(e.target, "red");
    } else if (e.target.validity.tooLong) {
        e.target.setCustomValidity(
            `${fieldName} needs to be ${max} characters long.`
        );
        displayInvalid(e.target, "red");
    } else {
        e.target.setCustomValidity("");
        displayValid(e.target);
    }

    return true;
};

module.exports = {
    displayInvalid,
    displayValid,
    invalidEmailMsg,
    invalidMinMaxMsg,
    invalidNumber,
};
