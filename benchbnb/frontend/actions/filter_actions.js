export const FilterConstants = {
  UPDATE_BOUNDS: "UPDATE_BOUNDS"
};

export const updateBounds = (filter, value) => ({
  type: FilterConstants.UPDATE_BOUNDS,
  filter: filter,
  value: value
})
