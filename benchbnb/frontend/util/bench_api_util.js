export const fetchBenches = function (filters, success) {
  $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: filters,
    success,
    error: () => console.log('error')
  });
};
