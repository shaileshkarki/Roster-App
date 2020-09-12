// GJ: This modules calcualtes the break times depending on the length of shifts
const calculateBreak = (rostered_hours) => {
    // convert to number first
    const rh = Number(rostered_hours);
    var breakTime = 0;

    if (rh < 3.5) {
        return (breakTime = 0);
    } else if (rh >= 3.5 && rh < 5) {
        return (breakTime = 0.25);
    } else if (rh >= 5 && rh < 8) {
        return (breakTime = 0.5);
    } else {
        return (breakTime = 1);
    }
};

export default calculateBreak;
