package com.reviewfinder.util;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import com.reviewfinder.movie.dao.MovieDTO;

public class PosterSlice {
	public static String slicePosterUrl(MovieDTO movie) {
		String poster = movie.getMovie_poster();

		poster = poster.trim();

		if (poster != null || poster.equals("")) {
			int idx = poster.indexOf("|");
			if (idx != -1) {
				poster = poster.substring(0, idx);
			}
		}

		return poster;
	}

	public static String sliceStillUrl(MovieDTO movie) {
		String still_img = movie.getMovie_still_image();

		still_img = still_img.trim();

		if (still_img != null || still_img.equals("")) {
			int idx = still_img.indexOf("|");
			if (idx != -1) {
				still_img = still_img.substring(0, idx);
			}
		}

		return still_img;
	}
	
	public static List<String> getStillUrlArray(MovieDTO movie) {
		String still_img = movie.getMovie_still_image();
		
		still_img = still_img.trim();
		
		if (still_img != null || still_img.equals("")) {
			String[] temp = still_img.split("\\|");
			return Arrays.asList(temp);
		}
		
		return null;
	}
	
	
}
