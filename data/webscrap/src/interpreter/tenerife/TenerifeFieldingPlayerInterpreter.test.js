import { JSDOM } from 'jsdom';
import { describe, expect, it } from 'vitest';
import { TenerifeFieldingPlayerInterpreter } from './TenerifeFieldingPlayerInterpreter.js';

const input = `
<td align=left><font face=verdana size=1 color="#000000">Leonardo Izaguirre, CARACAS&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">31&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">30&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">1&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">0&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">1.000&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">4&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">0&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">10&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">  ---&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">20&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">30&nbsp;</td>
`;

describe('TenerifeFieldingPlayerInterpreter with correct data', () => {
	const playerInterpreter = new TenerifeFieldingPlayerInterpreter(new JSDOM(input).window.document.body);
	
	describe('getPlayerSurName', () => {
		it('should return the player\'s surname', () => {
			const result = playerInterpreter.getPlayerSurName();
			expect(result).toBe('Izaguirre');
		});
	});

	describe('getPlayerFirstName', () => {
		it('should return the player\'s first name', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('Leonardo');
		});
	});

	describe('getTeam', () => {
		it('should return the player\'s team', () => {
			const result = playerInterpreter.getTeam();
			expect(result).toBe('CARAC');
		});
	});

	describe('getG', () => {
		it('should return the player\'s G', () => {
			const result = playerInterpreter.getG();
			expect(result).toBe('');
		});
	});

	describe('getC', () => {
		it('should return the player\'s C', () => {
			const result = playerInterpreter.getC();
			expect(result).toBe('31');
		});
	});

	describe('getPO', () => {
		it('should return the player\'s PO', () => {
			const result = playerInterpreter.getPO();
			expect(result).toBe('30');
		});
	});

	describe('getA', () => {
		it('should return the player\'s A', () => {
			const result = playerInterpreter.getA();
			expect(result).toBe('1');
		});
	});

	describe('getE', () => {
		it('should return the player\'s E', () => {
			const result = playerInterpreter.getE();
			expect(result).toBe('0');
		});
	});

	describe('getFLDP', () => {
		it('should return the player\'s FLDP', () => {
			const result = playerInterpreter.getFLDP();
			expect(result).toBe('');
		});
	});

	describe('getDP', () => {
		it('should return the player\'s DP', () => {
			const result = playerInterpreter.getDP();
			expect(result).toBe('4');
		});
	});

	describe('getSBA', () => {
		it('should return the player\'s SBA', () => {
			const result = playerInterpreter.getSBA();
			expect(result).toBe('0');
		});
	});

	describe('getCSB', () => {
		it('should return the player\'s CSB', () => {
			const result = playerInterpreter.getCSB();
			expect(result).toBe('10');
		});
	});

	describe('getSBAP', () => {
		it('should return the player\'s SBAP', () => {
			const result = playerInterpreter.getSBAP();
			expect(result).toBe('');
		});
	});

	describe('getPB', () => {
		it('should return the player\'s PB', () => {
			const result = playerInterpreter.getPB();
			expect(result).toBe('20');
		});
	});

	describe('getCI', () => {
		it('should return the player\'s CI', () => {
			const result = playerInterpreter.getCI();
			expect(result).toBe('30');
		});
	});
});