package com.nttdata.apitrello;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.is;

import com.nttdata.apitrello.core.BaseTest;
import com.nttdata.apitrello.model.Board;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TrelloApiTest extends BaseTest {
	
	private static String listID;
	private static String cardID;	
	
	@Test
	@Order(1)
	public void test_criarBoardComSucesso() {
		Board board = given()
			.spec(requestSpec)
			.log().all()
			.queryParams("name", "Test Case 1")
        .when()
        	.post("1/boards").
        then()
        	.log().all()
        	.statusCode(200)
        	.body("name", is("Test Case 1") )
        	.extract().body().as(Board.class);
		boardID = board.getId();
	}

	@Test
	@Order(2)
	public void test_criarListNoBoardComSucesso() {
		listID = 
		 given()
			.spec(requestSpec)
            .pathParam("id", boardID)
            .queryParam("name","List 1")
         .when()
         	.post("1/boards/{id}/lists")
         .then()
         	.log().all()
         	.statusCode(200)
         	.extract().path("id");
	}	
	
	@Test
	@Order(3)
	public void test_criarCardNaListComSucesso() {
		System.out.println("************ List ID: " + listID);
		cardID = 
		  given()
		  	.spec(requestSpec)
            .queryParam("name", "Card 1")
            .queryParam("idList", listID)
          .when()
          	.post("1/cards")
          .then()
          	.log().all()
          	.statusCode(200)
          	.body("name",is("Card 1"))
          	.body("idBoard",is(boardID))
          	.body("idList",is(listID))
            .extract().path("id");
	}	
	
	@Test
	@Order(4)
	public void test_excluirCardNaListComSucesso() {
		System.out.println("************ Card ID: " + cardID);
		  given()
		  	.spec(requestSpec)
            .pathParam("id", cardID)
          .when()
          	.delete("1/cards/{id}")
          .then()
          	.log().all()
          	.statusCode(200);
	}	
	
	@Test
	@Order(5)
	public void test_excluirBoardComSucesso() {
		System.out.println("************ Board ID: " + boardID);
		given()
			.spec(requestSpec)
			.pathParam("id", boardID)
			.body("")
		.when()
			.delete("1/boards/{id}");
	}	
}
