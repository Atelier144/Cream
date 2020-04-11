module ApplicationHelper
    def default_meta_tags
        {
            site: "CREAM",
            title: "アプリ開発の仲間が探せる",
            reverse: true,
            charset: "utf-8",
            description: "CREAMはアプリ開発の仲間を募るサービスです。無料で利用できます。",
            keywords: ["アプリ開発","アプリ開発仲間"],
            viewport: "width=device-width, initial-scale=1.0"
        }
    end
end
