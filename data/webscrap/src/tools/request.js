import axios from 'axios';

export function getWebPage(url) {
	return axios.get(url, {
		headers: {
			'User-Agent': 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)',
			Accept: '*/*'
		}
	})
}