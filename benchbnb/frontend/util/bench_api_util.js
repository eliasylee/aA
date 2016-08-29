export const fetchBenches = function (filters, success) {
  $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: filters,
    success
  });
};

export const createBench = function (bench, success) {
  $.ajax({
    method: 'POST',
    url: 'api/benches',
    data: bench,
    success
  });
};
