export const BenchConstants = {
  REQUEST_BENCHES: "REQUEST_BENCHES",
  RECEIVE_BENCHES: "RECEIVE_BENCHES"
};

export const requestBenches = () => ({
  type: BenchConstants.REQUEST_BENCHES
});

export const receiveBenches = benches => ({
  type: BenchConstants.RECEIVE_BENCHES,
  benches
});
