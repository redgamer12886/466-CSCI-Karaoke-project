-- =====================================================================
-- CSCI 466 Group Project: Karaoke Management System
-- File: insert_sample_data.sql
-- Description: Inserts required sample data:
--   - Exactly 30 songs from curated playlist
--   - 30 contributors with distinct musical roles
--   - 60 karaoke files (Solo, Duet, Instrumental versions)
--   - M:N contributor-song role mappings (ContributesTo)
--   - 10 registered user accounts
--   - 6 FreeQueue entries (FIFO)
--   - 6 AcceleratedQueue entries with payment amounts ($5 - $20)
-- =====================================================================

DELETE FROM AcceleratedQueue;
DELETE FROM FreeQueue;
DELETE FROM ContributesTo;
DELETE FROM KaraokeFile;
DELETE FROM Contributor;
DELETE FROM User;
DELETE FROM Song;

-- 1. Insert 30 Songs
INSERT INTO Song (SongID, Title, Artist) VALUES
(1, 'What You Know', 'Two Door Cinema Club'),
(2, 'On the Square', 'Mac DeMarco'),
(3, 'Little Dark Age', 'MGMT'),
(4, 'Waiting For Love', 'Avicii'),
(5, 'Feathery (Bonus Track)', 'Milky Chance'),
(6, 'Jesus Freak Lighter', 'Blood Orange'),
(7, 'Comet (feat. Tom Scharpling)', 'Steven Universe'),
(8, 'Mr. Rager', 'Kid Cudi'),
(9, 'Genie', 'Crumb'),
(10, 'Royals', 'Lorde'),
(11, 'Cariño', 'The Marías'),
(12, 'Won''t Be Possible', 'Tiësto, Odd Mob & Goodboys'),
(13, 'Bags', 'Clairo'),
(14, 'Insane In the Brain', 'Cypress Hill'),
(15, 'Una Vez', 'Bad Bunny & Mora'),
(16, 'Pink Dolphin Sunset (feat. Tee)', 'Tory Lanez'),
(17, 'Homemade Dynamite (Remix)', 'Lorde'),
(18, 'Shadows', 'Pastel Ghost'),
(19, 'Better in the Dark', 'Jordana & TV Girl'),
(20, 'The Blonde', 'TV Girl'),
(21, 'What Once Was', 'Her''s'),
(22, 'Ease My Mind', 'Chris Lake & Abel Balder'),
(23, 'Yes I''m Changing', 'Tame Impala'),
(24, 'In My Head', 'Chris Lake & Amber Mark'),
(25, 'tell you straight', 'jigitz'),
(26, 'B2b', 'Charli xcx'),
(27, 'first time', 'jigitz'),
(28, 'XXX', 'Crumb'),
(29, 'Retreat!', 'Crumb'),
(30, 'Radio', 'Lana Del Rey');

-- 2. Insert 30 Contributors
INSERT INTO Contributor (ContributorID, Name) VALUES
(1, 'Alex Trimble'),
(2, 'Mac DeMarco'),
(3, 'Andrew VanWyngarden'),
(4, 'Tim Bergling (Avicii)'),
(5, 'Clemens Rehbein'),
(6, 'Devonté Hynes'),
(7, 'Rebecca Sugar'),
(8, 'Tom Scharpling'),
(9, 'Scott Mescudi (Kid Cudi)'),
(10, 'Lila Ramani'),
(11, 'Ella Yelich-O''Connor (Lorde)'),
(12, 'María Zardoya'),
(13, 'Tijs Verwest (Tiësto)'),
(14, 'Claire Cottrill (Clairo)'),
(15, 'Louis Freese (B-Real)'),
(16, 'Senon Reyes (Sen Dog)'),
(17, 'Benito Ocasio (Bad Bunny)'),
(18, 'Gabriel Mora (Mora)'),
(19, 'Daystar Peterson (Tory Lanez)'),
(20, 'Vivian Moon'),
(21, 'Jordana Nye'),
(22, 'Brad Petering'),
(23, 'Stephen Fitzpatrick'),
(24, 'Chris Lake'),
(25, 'Abel Balder'),
(26, 'Kevin Parker'),
(27, 'Amber Mark'),
(28, 'jigitz'),
(29, 'Charlotte Aitchison (Charli xcx)'),
(30, 'Elizabeth Grant (Lana Del Rey)');

-- 3. Insert Karaoke Files (60 versions: Solo, Duet, Instrumental)
INSERT INTO KaraokeFile (FileID, SongID, VersionType, FileName) VALUES
(1, 1, 'Solo', 'what_you_know_solo.mp3'),
(2, 1, 'Instrumental', 'what_you_know_instrumental.mp3'),
(3, 2, 'Solo', 'on_the_square_solo.mp3'),
(4, 2, 'Instrumental', 'on_the_square_instrumental.mp3'),
(5, 3, 'Solo', 'little_dark_age_solo.mp3'),
(6, 3, 'Instrumental', 'little_dark_age_instrumental.mp3'),
(7, 4, 'Solo', 'waiting_for_love_solo.mp3'),
(8, 4, 'Instrumental', 'waiting_for_love_instrumental.mp3'),
(9, 5, 'Solo', 'feathery_solo.mp3'),
(10, 5, 'Instrumental', 'feathery_instrumental.mp3'),
(11, 6, 'Solo', 'jesus_freak_lighter_solo.mp3'),
(12, 6, 'Instrumental', 'jesus_freak_lighter_instrumental.mp3'),
(13, 7, 'Solo', 'comet_solo.mp3'),
(14, 7, 'Duet', 'comet_duet.mp4'),
(15, 8, 'Solo', 'mr._rager_solo.mp3'),
(16, 8, 'Instrumental', 'mr._rager_instrumental.mp3'),
(17, 9, 'Solo', 'genie_solo.mp3'),
(18, 9, 'Instrumental', 'genie_instrumental.mp3'),
(19, 10, 'Solo', 'royals_solo.mp3'),
(20, 10, 'Instrumental', 'royals_instrumental.mp3'),
(21, 11, 'Solo', 'cariño_solo.mp3'),
(22, 11, 'Instrumental', 'cariño_instrumental.mp3'),
(23, 12, 'Solo', 'wont_be_possible_solo.mp3'),
(24, 12, 'Duet', 'wont_be_possible_duet.mp4'),
(25, 13, 'Solo', 'bags_solo.mp3'),
(26, 13, 'Instrumental', 'bags_instrumental.mp3'),
(27, 14, 'Solo', 'insane_in_the_brain_solo.mp3'),
(28, 14, 'Instrumental', 'insane_in_the_brain_instrumental.mp3'),
(29, 15, 'Solo', 'una_vez_solo.mp3'),
(30, 15, 'Duet', 'una_vez_duet.mp4'),
(31, 16, 'Solo', 'pink_dolphin_sunset_solo.mp3'),
(32, 16, 'Duet', 'pink_dolphin_sunset_duet.mp4'),
(33, 17, 'Solo', 'homemade_dynamite_solo.mp3'),
(34, 17, 'Instrumental', 'homemade_dynamite_instrumental.mp3'),
(35, 18, 'Solo', 'shadows_solo.mp3'),
(36, 18, 'Instrumental', 'shadows_instrumental.mp3'),
(37, 19, 'Solo', 'better_in_the_dark_solo.mp3'),
(38, 19, 'Duet', 'better_in_the_dark_duet.mp4'),
(39, 20, 'Solo', 'the_blonde_solo.mp3'),
(40, 20, 'Instrumental', 'the_blonde_instrumental.mp3'),
(41, 21, 'Solo', 'what_once_was_solo.mp3'),
(42, 21, 'Instrumental', 'what_once_was_instrumental.mp3'),
(43, 22, 'Solo', 'ease_my_mind_solo.mp3'),
(44, 22, 'Duet', 'ease_my_mind_duet.mp4'),
(45, 23, 'Solo', 'yes_im_changing_solo.mp3'),
(46, 23, 'Instrumental', 'yes_im_changing_instrumental.mp3'),
(47, 24, 'Solo', 'in_my_head_solo.mp3'),
(48, 24, 'Duet', 'in_my_head_duet.mp4'),
(49, 25, 'Solo', 'tell_you_straight_solo.mp3'),
(50, 25, 'Instrumental', 'tell_you_straight_instrumental.mp3'),
(51, 26, 'Solo', 'b2b_solo.mp3'),
(52, 26, 'Instrumental', 'b2b_instrumental.mp3'),
(53, 27, 'Solo', 'first_time_solo.mp3'),
(54, 27, 'Instrumental', 'first_time_instrumental.mp3'),
(55, 28, 'Solo', 'xxx_solo.mp3'),
(56, 28, 'Instrumental', 'xxx_instrumental.mp3'),
(57, 29, 'Solo', 'retreat!_solo.mp3'),
(58, 29, 'Instrumental', 'retreat!_instrumental.mp3'),
(59, 30, 'Solo', 'radio_solo.mp3'),
(60, 30, 'Instrumental', 'radio_instrumental.mp3');

-- 4. Insert ContributesTo (SongID, ContributorID, Role)
INSERT INTO ContributesTo (SongID, ContributorID, Role) VALUES
(1, 1, 'Singer'),
(1, 1, 'Guitarist'),
(1, 1, 'Songwriter'),
(2, 2, 'Singer'),
(2, 2, 'Songwriter'),
(2, 2, 'Producer'),
(3, 3, 'Singer'),
(3, 3, 'Synthesizer'),
(3, 3, 'Songwriter'),
(4, 4, 'Producer'),
(4, 4, 'Songwriter'),
(5, 5, 'Singer'),
(5, 5, 'Guitarist'),
(6, 6, 'Singer'),
(6, 6, 'Songwriter'),
(6, 6, 'Producer'),
(7, 7, 'Songwriter'),
(7, 8, 'Featured Vocalist'),
(8, 9, 'Singer'),
(8, 9, 'Songwriter'),
(9, 10, 'Singer'),
(9, 10, 'Lead Guitarist'),
(10, 11, 'Singer'),
(10, 11, 'Songwriter'),
(11, 12, 'Lead Vocalist'),
(11, 12, 'Songwriter'),
(12, 13, 'DJ / Producer'),
(13, 14, 'Singer'),
(13, 14, 'Songwriter'),
(13, 14, 'Guitarist'),
(14, 15, 'Lead Rapper'),
(14, 16, 'Rapper'),
(15, 17, 'Lead Vocalist'),
(15, 18, 'Featured Vocalist'),
(15, 17, 'Songwriter'),
(16, 19, 'Singer'),
(16, 19, 'Producer'),
(17, 11, 'Lead Vocalist'),
(17, 11, 'Songwriter'),
(18, 20, 'Singer'),
(18, 20, 'Producer'),
(19, 21, 'Lead Vocalist'),
(19, 22, 'Producer'),
(20, 22, 'Lead Vocalist'),
(20, 22, 'Songwriter'),
(21, 23, 'Singer'),
(21, 23, 'Guitarist'),
(22, 24, 'Producer'),
(22, 25, 'Vocalist'),
(23, 26, 'Singer'),
(23, 26, 'Songwriter'),
(23, 26, 'Multi-Instrumentalist'),
(24, 24, 'Producer'),
(24, 27, 'Featured Vocalist'),
(25, 28, 'Producer'),
(25, 28, 'Songwriter'),
(26, 29, 'Lead Vocalist'),
(26, 29, 'Songwriter'),
(27, 28, 'Producer'),
(27, 28, 'Singer'),
(28, 10, 'Singer'),
(28, 10, 'Guitarist'),
(29, 10, 'Singer'),
(29, 10, 'Songwriter'),
(30, 30, 'Singer'),
(30, 30, 'Songwriter');

-- 5. Insert 10 Users
INSERT INTO User (UserID, UserName) VALUES
(1, 'Mark Sanchez'),
(2, 'Victor Huskie'),
(3, 'Sarah Jenkins'),
(4, 'David Martinez'),
(5, 'Emily Chen'),
(6, 'Alex Johnson'),
(7, 'Jessica Taylor'),
(8, 'Brian O''Connor'),
(9, 'Rachel Green'),
(10, 'Carlos Gomez');

-- 6. Insert FreeQueue (FIFO Queue Requests)
INSERT INTO FreeQueue (QueueID, UserID, FileID, SignUpTime) VALUES
(1, 1, 1, '2026-11-16 20:00:00'),
(2, 3, 5, '2026-11-16 20:05:00'),
(3, 5, 19, '2026-11-16 20:12:00'),
(4, 7, 25, '2026-11-16 20:18:00'),
(5, 9, 39, '2026-11-16 20:25:00'),
(6, 2, 45, '2026-11-16 20:30:00');

-- 7. Insert AcceleratedQueue (Priority Queue with AmountPaid)
INSERT INTO AcceleratedQueue (QueueID, UserID, FileID, SignUpTime, AmountPaid) VALUES
(1, 2, 15, '2026-11-16 20:02:00', 5.00),
(2, 4, 27, '2026-11-16 20:07:00', 15.00),
(3, 6, 29, '2026-11-16 20:14:00', 10.00),
(4, 8, 51, '2026-11-16 20:20:00', 20.00),
(5, 10, 59, '2026-11-16 20:28:00', 7.50),
(6, 1, 41, '2026-11-16 20:35:00', 12.00);

-- Verification Queries
SELECT 'Songs Count:' AS Metric, COUNT(*) AS Total FROM Song;
SELECT 'Contributors Count:' AS Metric, COUNT(*) AS Total FROM Contributor;
SELECT 'Karaoke Files Count:' AS Metric, COUNT(*) AS Total FROM KaraokeFile;
SELECT 'ContributesTo Count:' AS Metric, COUNT(*) AS Total FROM ContributesTo;
SELECT 'Users Count:' AS Metric, COUNT(*) AS Total FROM User;
SELECT 'FreeQueue Entries:' AS Metric, COUNT(*) AS Total FROM FreeQueue;
SELECT 'AcceleratedQueue Entries:' AS Metric, COUNT(*) AS Total FROM AcceleratedQueue;