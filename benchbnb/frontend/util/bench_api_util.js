export const fetchBenches = function (filters, success) {
  $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: filters,
    success
  });
};

export const createBench = function (success) {
  $.ajax({
    method: 'POST',
    url: 'api/benches',
    success
  })
}
