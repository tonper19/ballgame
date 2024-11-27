import { JSDOM } from 'jsdom';
import { describe, expect, it } from 'vitest';
import { TenerifePitchingPlayerInterpreter } from './TenerifePitchingPlayerInterpreter.js';

const input = `
<td align=left><font face=verdana size=1 color="#000000">Juan Carlos Macias, CARIBEN&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000"> 3.27&nbsp;</td>

<td align=center><font face=verdana size=1 color="#000000">2-1&nbsp;</td>

<td align=center><font face=verdana size=1 color="#000000">3-1&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">1&nbsp;</td>

<td align=center><font face=verdana size=1 color="#000000">10/15&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">0&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">15.0&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">18&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">13&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">7&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">3&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">6&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">3&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">1&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">0&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">66&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000"> .273&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">3&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">2&nbsp;</td>

<td align=right><font face=verdana size=1 color="#000000">0&nbsp;</td>
`;

describe('TenerifePitchingPlayerInterpreter with correct data', () => {
	const playerInterpreter = new TenerifePitchingPlayerInterpreter(new JSDOM(input).window.document.body);

	describe('getPlayerSurName', () => {
		it('should return the player\'s surname', () => {
			const result = playerInterpreter.getPlayerSurName();
			expect(result).toBe('Carlos Macias');
		});
	});
	
	describe('getPlayerFirstName', () => {
		it('should return the player\'s first name', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('Juan');
		});
	});

	describe('getTeam', () => {
		it('should return the player\'s team', () => {
			const result = playerInterpreter.getTeam();
			expect(result).toBe('CARIB');
		});
	});	
	
	describe('getW', () => {
		it('should return the player\'s wins', () => {
			const result = playerInterpreter.getW();
			expect(result).toBe('2');
		});
	});	
	
	describe('getL', () => {
		it('should return the player\'s losses', () => {
			const result = playerInterpreter.getL();
			expect(result).toBe('1');
		});
	});	
	
	describe('getERA', () => {
		it('should return the player\'s losses', () => {
			const result = playerInterpreter.getERA();
			expect(result).toBe('');
		});
	});
	
	describe('getAPP', () => {
		it('should return the player\'s appearances', () => {
			const result = playerInterpreter.getAPP();
			expect(result).toBe('3');
		});
	});	
	
	describe('getGS', () => {
		it('should return the player\'s appearances', () => {
			const result = playerInterpreter.getGS();
			expect(result).toBe('1');
		});
	});	
	
	describe('getSV', () => {
		it('should return the player\'s SV', () => {
			const result = playerInterpreter.getSV();
			expect(result).toBe('0');
		});
	});
		
	describe('getCG', () => {
		it('should return the player\'s CG', () => {
			const result = playerInterpreter.getCG();
			expect(result).toBe('1');
		});
	});
			
	describe('getCG', () => {
		it('should return the player\'s CG', () => {
			const result = playerInterpreter.getCG();
			expect(result).toBe('1');
		});
	});	
	
	describe('getSHO', () => {
		it('should return the player\'s SHO', () => {
			const result = playerInterpreter.getSHO();
			expect(result).toBe('10');
		});
	});	
	
	describe('getIP', () => {
		it('should return the player\'s IP', () => {
			const result = playerInterpreter.getIP();
			expect(result).toBe('15.0');
		});
	});
	
	describe('getH', () => {
		it('should return the player\'s H', () => {
			const result = playerInterpreter.getH();
			expect(result).toBe('18');
		});
	});	
	
	describe('getR', () => {
		it('should return the player\'s R', () => {
			const result = playerInterpreter.getR();
			expect(result).toBe('13');
		});
	});	
	
	describe('getR', () => {
		it('should return the player\'s R', () => {
			const result = playerInterpreter.getR();
			expect(result).toBe('13');
		});
	});	
	
	describe('getER', () => {
		it('should return the player\'s ER', () => {
			const result = playerInterpreter.getER();
			expect(result).toBe('7');
		});
	});	
	
	describe('getBB', () => {
		it('should return the player\'s BB', () => {
			const result = playerInterpreter.getBB();
			expect(result).toBe('3');
		});
	});	
	
	describe('getSO', () => {
		it('should return the player\'s SO', () => {
			const result = playerInterpreter.getSO();
			expect(result).toBe('6');
		});
	});	
	
	describe('getH2', () => {
		it('should return the player\'s H2', () => {
			const result = playerInterpreter.get2B();
			expect(result).toBe('3');
		});
	});	
	
	describe('getH3', () => {
		it('should return the player\'s H3', () => {
			const result = playerInterpreter.get3B();
			expect(result).toBe('1');
		});
	});	
	
	describe('getHR', () => {
		it('should return the player\'s HR', () => {
			const result = playerInterpreter.getHR();
			expect(result).toBe('0');
		});
	});	
	
	describe('getAB', () => {
		it('should return the player\'s AB', () => {
			const result = playerInterpreter.getAB();
			expect(result).toBe('66');
		});
	});	
	
	describe('getBAVG', () => {
		it('should return the player\'s BAVG', () => {
			const result = playerInterpreter.getBAVG();
			expect(result).toBe('');
		});
	});	
	
	describe('getWP', () => {
		it('should return the player\'s WP', () => {
			const result = playerInterpreter.getWP();
			expect(result).toBe('3');
		});
	});	
	
	describe('getWP', () => {
		it('should return the player\'s WP', () => {
			const result = playerInterpreter.getWP();
			expect(result).toBe('3');
		});
	});	
	
	describe('getHBP', () => {
		it('should return the player\'s HBP', () => {
			const result = playerInterpreter.getHB();
			expect(result).toBe('2');
		});
	});	
	
	describe('getBK', () => {
		it('should return the player\'s BK', () => {
			const result = playerInterpreter.getBK();
			expect(result).toBe('0');
		});
	});	
	
	describe('getSFA', () => {
		it('should return the player\'s SFA', () => {
			const result = playerInterpreter.getSFA();
			expect(result).toBe('');
		});
	});	
	
	describe('getSHA', () => {
		it('should return the player\'s SHA', () => {
			const result = playerInterpreter.getSHA();
			expect(result).toBe('');
		});
	});	
	
	describe('getGO', () => {
		it('should return the player\'s GO', () => {
			const result = playerInterpreter.getGO();
			expect(result).toBe('');
		});
	});	
	
	describe('getFO', () => {
		it('should return the player\'s FO', () => {
			const result = playerInterpreter.getFO();
			expect(result).toBe('');
		});
	});	
});