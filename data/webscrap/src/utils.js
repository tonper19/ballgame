export function formatLeadingZero(value) {
	return value.startsWith('.') ? `0${value}`:value;
}

export function removeSpaces(value) {
	return value.replaceAll(/\s+/g, '');
}