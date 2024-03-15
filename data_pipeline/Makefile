deploy-development:
	sls deploy --stage development

run_local:
	poetry run python run_local.py

create-requirements:
	poetry export --without dev --without-hashes --format=requirements.txt > requirements.txt

docker-build:
	docker build -t data_pipeline .

setup-docker: create-requirements docker-build