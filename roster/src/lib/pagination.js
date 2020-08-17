export function paginate(data, currentPage, numberOfRecords) {
  let paginatedData = [];
  const startPosition = currentPage * numberOfRecords;
  for (
    let i = startPosition;
    i < startPosition + numberOfRecords && i < data.length;
    i++
  ) {
    paginatedData.push(data[i]);
  }
  return paginatedData;
}
