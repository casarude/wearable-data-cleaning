Human Activity Recognition Using Smartphones Dataset - CODEBOOK

1. Activities: Activities performed by the subjects

        1 = WALKING
        2 = WALKING_UPSTAIRS
        3 = WALKING_DOWNSTAIRS
        4 = SITTING
        5 = STANDING
        6 = LAYING

2. Subjects: Thirty (30) volunteers who performed the Activities wearing a smartphone. Range from 1 to 30.

3. Features: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals       tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of     50 Hz. Similarly, the acceleration signal was then separated into body and gravity acceleration signals               (tBodyAcc-XYZ and tGravityAcc-XYZ) with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration      and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the    magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag,    tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

4. Transformations: A Fast Fourier Transform (FFT) was applied to some of these signals producing 

        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag. 
    
    (Note the 'f' to indicate requency domain signals). 
   
   These signals were used to estimate variables of the feature vector for each pattern:  
   ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions)


        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
    
4. Estatistics: The set of statitisics that were estimated from these signals are: 

        mean(): Mean value
        std(): Standard deviation
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        
    Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle()         variable: 
    
        gravityMean
        tBodyAccMean
        tBodyAccJerkMean
        tBodyGyroMean
        tBodyGyroJerkMean

    
    
    



