package com.reviewfinder.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.reviewfinder.movie.dao.MovieDTO;

public class StringSlice {
	// 포스터 url 하나만 가져오기
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
	
	// 스틸이미지 url 하나만 가져오기
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
	
	// 스틸이미지 리스트로 반환
	public static List<String> getStillUrlArray(MovieDTO movie) {
		String still_img = movie.getMovie_still_image();
		
		still_img = still_img.trim();
		
		if (still_img != null || still_img.equals("")) {
			String[] temp = still_img.split("\\|");
			return Arrays.asList(temp);
		}
		
		return null;
	}
	
	// 배우 목록 리스트로 반환
	public static List<String> getActors(MovieDTO movie){
		String actors = movie.getMovie_actor();
		
		actors = actors.trim();
		
		if(actors != null || actors.equals("")) {
			String[] temp = actors.split("\\|");
			return Arrays.asList(temp);
		}
		return null;
	}
	
	// 감독 목록 리스트로 반환
	public static List<String> getDirectors(MovieDTO movie){
		String directors = movie.getMovie_director();
		
		directors = directors.trim();
		
		if(directors != null || directors.equals("")) {
			String[] temp = directors.split("\\|");
			return Arrays.asList(temp);
		}
		return null;
	}
	
	// 장르 슬라이스
	public static List<String> sliceGenre(MovieDTO movie){
		String[] genre = movie.getMovie_genre().split(",");
		List<String> genreList = new ArrayList<String>();
		
		if(genre.length>1) {
			for(int i=0;i<genre.length;i++) {
				if(genre[i].equals("멜로/로맨스")) {
					genreList.add("멜로");
					genreList.add("로맨스");
				}else {
					genreList.add(genre[i]);
				}
			}
			return genreList;
		}
		
		if(genre[0].equals("멜로/로맨스")) {
			genreList.add("멜로");
			genreList.add("로맨스");
		}else {
			genreList = Arrays.asList(genre);
		}
		
		return genreList;
	}
}
