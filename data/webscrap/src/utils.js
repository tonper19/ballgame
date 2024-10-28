export function formatLeadingZero(value) {
	return value?.startsWith('.') ? `0${value}`:value;
}
