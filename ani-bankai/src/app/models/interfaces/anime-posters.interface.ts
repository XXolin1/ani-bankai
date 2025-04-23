export enum AnimeStatus {
    AIRING = 'airing', // Currently airing anime
    FINISHED = 'finished', // Finished airing anime
    NOT_YET_AIRED = 'not_yet_aired', // Anime that has not yet aired
    CANCELLED = 'cancelled', // Cancelled anime
    UNKNOWN = 'unknown' // Unknown status
}

export enum AnimeGenre {
    ACTION = 'action',
    ADVENTURE = 'adventure',
    COMEDY = 'comedy',
    DRAMA = 'drama', 
    FANTASY = 'fantasy',
    HORROR = 'horror',
    MYSTERY = 'mystery',
    ROMANCE = 'romance', 
    SCI_FI = 'sci-fi',
    THRILLER = 'thriller'

}

export enum Season {
    WINTER = 'winter',
    SPRING = 'spring',
    SUMMER = 'summer',
    FALL = 'fall'
}

export interface AnimePosters {
    title: string; // Title of the anime
    mediumPicture?: string; // URL of the medium-sized picture
    largePicture?: string; // URL of the large-sized picture
    japanName?: string; // Japanese name of the anime
    englishName?: string; // English name of the anime
    startDate?: string; // Start date of the anime
    endDate?: string; // End date of the anime
    synopsis?: string; // Synopsis of the anime
    rank?: number; // Rank of the anime
    popularity?: number; // Popularity score of the anime
    nsfw?: boolean; // Indicates if the anime is NSFW (Not Safe For Work)
    updatedAt?: string; // Last updated date of the anime
    status?: AnimeStatus; // Current status of the anime (e.g., airing, finished)
    nbrEpisodes?: number; // Number of episodes in the anime
    seasonAnime?: Season; // Season in which the anime was released (e.g., winter, spring)
    genres?: AnimeGenre[]; // List of genres associated with the anime
    broadcast?: string; // Broadcast information (e.g., channel, time)
    source?: string; // Source material (e.g., manga, light novel)
    averageEpisodeDuration?: number; // Average duration of each episode in minutes

}