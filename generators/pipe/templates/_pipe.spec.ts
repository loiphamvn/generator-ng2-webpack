/* beautify ignore:start */
import {it} from '@angular/core/testing';
import {<%=pipenameClass %>Pipe} from './index';
/* beautify ignore:end */

describe('Pipe: <%=pipenameClass%>Pipe', () => {
	let pipe: <%=pipenameClass %>Pipe;

	beforeEach(() => {
		pipe = new <%=pipenameClass %>Pipe();
	});

	it('should be defined', () => {
		expect(pipe).toBeDefined();
	});

    it('transforms abc to abc', () => {
        expect(pipe.transform('abc')).toEqual('abc');
    });

});