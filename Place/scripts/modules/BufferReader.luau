local module = {}

function module:GetIdx(data: buffer, idx: number, frameOffset: number?): (number, number, number)
	assert(idx % 1 == 0 and idx >= 0 and idx <= 32, "GetIdx out of bounds 0-32")

	local offset = (frameOffset or 0) + idx * 12

	return Vector3.New(
			buffer.readf32(data, offset),
			buffer.readf32(data, offset + 4),
			buffer.readf32(data, offset + 8)
		)
end

return module