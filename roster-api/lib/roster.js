const convertStringDateToMilliseconds = (dateString) => {
  try {
    return new Date(dateString).getTime();
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  convertStringDateToMilliseconds,
};
