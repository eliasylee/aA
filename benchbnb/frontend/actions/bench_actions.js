export const BenchConstants = {
  REQUEST_BENCHES: "REQUEST_BENCHES",
  RECEIVE_BENCHES: "RECEIVE_BENCHES",
  CREATE_BENCH: "CREATE_BENCH",
  RECEIVE_BENCH: "RECEIVE_BENCH"
};

export const requestBenches = () => ({
  type: BenchConstants.REQUEST_BENCHES
});

export const receiveBenches = benches => ({
  type: BenchConstants.RECEIVE_BENCHES,
  benches
});

export const createBench = () => ({
  type: BenchConstants.CREATE_BENCH
})

export const receiveBench = bench => ({
  type: BenchConstants.RECEIVE_BENCH,
  bench
})
