export class Interpreter {

	constructor(container) {
		this.container = container;
	}

	_getPropertyNode(prop) {
		return this.container.querySelector(prop);
	}

	_getProperty(prop) {
		return this._getPropertyNode(prop)?.textContent;
	}

	_getPropertyAsHTML(prop) {
		return this._getPropertyNode(prop)?.innerHTML;
	}

}