const convertStringDateToMilliseconds = (dateString) => {
  try {
    return new Date(dateString).getTime();
  } catch (error) {
    console.log(error);
  }
};

const convertMillisecondsToLocalTime = function (timeInMilliseconds) {
  let time = new Date(Number(timeInMilliseconds)).toLocaleTimeString("en-US", {
    hour: "numeric",
    minute: "numeric",
  });
  return time;
};
const convertMillisecondsToHour = function (timeInMilliseconds) {
  return Number(timeInMilliseconds) / 1000 / 60 / 60;
};
const calculateBreak = function (shiftStartTime, shiftEndTime) {
  let startTime = convertMillisecondsToHour(shiftStartTime);
  let endTime = convertMillisecondsToHour(shiftEndTime);
  let shiftLength = endTime - startTime;
  if (shiftLength <= 3.5) {
    return 0;
  } else if (shiftLength > 3.5 && shiftLength <= 5) {
    return 0.25;
  } else if (shiftLength > 5 && shiftLength <= 8) {
    return 0.5;
  } else {
    return 1;
  }
};

const convertMillisecondsToDate = function (timeInMilliseconds) {
  let date = new Date(Number(timeInMilliseconds)).toDateString();
  return date;
};
const calculateShiftDurationExcludingBreak = function (
  shiftStartTime,
  shiftEndTime
) {
  return (
    convertMillisecondsToHour(shiftEndTime) -
    convertMillisecondsToHour(shiftStartTime) -
    calculateBreak(shiftStartTime, shiftEndTime)
  );
};
module.exports = {
  convertStringDateToMilliseconds,
  convertMillisecondsToLocalTime,
  convertMillisecondsToDate,
  calculateBreak,
  calculateShiftDurationExcludingBreak,
};
