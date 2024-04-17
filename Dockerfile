# Используем официальный образ Jenkins LTS как базовый
FROM jenkins/jenkins:lts

# Устанавливаем дополнительные плагины
RUN /usr/local/bin/install-plugins.sh \
    git \
    job-dsl \
    workflow-aggregator \
    pipeline-stage-view \
    blueocean \
    docker-workflow

# Открываем порты 8080 и 50000 для HTTP и агентского доступа
EXPOSE 8080 50000

# Автоматически запускаем Jenkins при старте контейнера
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
