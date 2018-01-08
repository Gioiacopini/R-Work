# Excercise 1 
One longstanding debate in the study of international relations concerns the question of
whether individual political leaders can make a difference. Some emphasize that leaders with
different ideologies and personalities can significantly affect the course of a nation. Others
argue that political leaders are severely constrained by historical and institutional forces. Did
individuals like Hitler, Mao, Roosevelt, and Churchill make a big difference? The difficulty
of empirically testing these arguments stems from the fact that the change of leadership is not
random and there are many confounding factors to be adjusted for.
In this assessment, we consider a natural experiment in which the success or failure of
assassination attempts is assumed to be essentially random. Each observation of the CSV data
set leaders.csv contains information about an assassination attempt

Table 2.8 presents the names and descriptions of variables in this leader assassination dataset.
The polity variable represents the so-called “polity score” from the Polity Project. 
The Polity Project systematically documents and quantifies the regime types of all countries in the
world from 1800. The polity score is a 21-point scale ranging from −10 (hereditary
monarchy) to 10 (consolidated democracy). The result variable is a 10-category factor
variable describing the result of each assassination attempt.

# Names and Descriptions of Variables in the Leader Assassination Data

year = year

leadername = the name of leader who was targeted

age = the age of targeted leader

politybefore = average polity score of country over 3 years prior to the attempt

polityafter = average polity score of country over 3 years after the attempt

civilwarbefore = 1 if country is in civil war during 3 years prior to the attempt, 0 otherwise

civilwarafter = 1 if country is in civil war during 3 years after the attempt, 0 otherwise

interwarbefore 1 = if country is in international war during 3 years prior to the attempt, 0 otherwise

interwarafter 1 = if country is in international war during 3 years after the attempt, 0 otherwise

result = the result of assassination attempt
