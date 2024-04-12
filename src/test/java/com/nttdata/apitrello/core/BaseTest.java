package com.nttdata.apitrello.core;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;

import static io.restassured.RestAssured.given;

public class BaseTest {

	protected static RequestSpecification requestSpec;
	protected static ResponseSpecification responseSpec;
	protected static String boardID;

	@BeforeAll
	static void setup() {
		RestAssured.baseURI = "https://api.trello.com/";
		requestSpec = new RequestSpecBuilder()
				.setBaseUri("https://api.trello.com")
				.addQueryParam("token", "ATTAd041ecd47113575d9eea6bcb3f27a4c3b89ba2ab41f4583fa26b84667aaf3a430D9E7137")
				.addQueryParam("key", "c316bd8e8fe94ad9875f72baad5cfaaa")
				.addHeader("Content-Type", "application/json")
				.build();
		
		responseSpec = new ResponseSpecBuilder()
				.expectStatusCode(200)
				.build();
		
	}

}
