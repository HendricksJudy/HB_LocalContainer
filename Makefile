build:
	@docker compose build

up-graders:
	@docker compose up -d magistral nemotron
	@echo "Waiting 180 s for model loading…"; sleep 180

eval:
	CANDIDATE_MODEL=$(MODEL) docker compose run --rm evaluator

test:
	docker compose run --rm evaluator -m pytest -q

clean:
	docker compose down -v
