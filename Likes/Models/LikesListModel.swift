//
//  LikesListModel.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/08.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import RxSwift
import TwitterKit

struct LikesListModel: Codable {
    let contributors: String
    let coordinates: String
    let created_at: Date
    let entities: Entry

    struct Entry: Codable {
        let urls: EntryURL
        let hashtags: [String]
        let user_mentions: [String]

        struct EntryURL: Codable {
            let display_url: URL
            let expanded_url: URL
            let url: URL
        }
    }

    let favorite_count: Int
    let favorited: Int
    let geo: String
    let id: String
    let id_str: String
    let in_reply_to_screen_name:String
    let in_reply_to_status_id: String
    let in_reply_to_status_id_str: String
    let in_reply_to_user_id: String
    let in_reply_to_user_id_str: String
    let is_quote_status: Int
    let lang: String
    let place: String
    let possibly_sensitive: Int
    let retweet_count: Int
    let retweeted: Int
    let source: String
    let text: String
    let truncated: Int
    let user: User

    struct User: Codable {
        let contributors_enabled: Int
        let created_at: Date
        let default_profile: Int
        let default_profile_image: Int
        let description: String
        let entities: [String]
        let favourites_count: Int
        let follow_request_sent: Int
        let followers_count: Int

        let friends_count: Int
        let geo_enabled: Int
        let has_extended_profile: Int
        let id: String
        let id_str: Int
        let is_translation_enabled: Int
        let is_translator: Int
        let lang: String
        let listed_count: Int
        let location: String
        let name: String
        let notifications: Int
        let profile_background_color: String
        let profile_background_image_url: String
        let profile_background_image_url_https: String
        let profile_background_tile: String
        let profile_image_url: String
        let profile_image_url_https: String
        let profile_link_color: String
        let profile_sidebar_border_color: String
        let profile_sidebar_fill_color: String
        let profile_text_color: String
        let profile_use_background_image: Int
        let protected: Int
        let screen_name: String
        let statuses_count: Int
        let time_zone: String
        let translator_type: String
        let url: String
        let utc_offset: String
        let verified: Int
    }
}

