-- CreateTable
CREATE TABLE "users" (
    "UserId" SERIAL NOT NULL,
    "UserName" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "UserType" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("UserId")
);

-- CreateTable
CREATE TABLE "course" (
    "CourseID" SERIAL NOT NULL,
    "CourseName" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "Price" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "course_pkey" PRIMARY KEY ("CourseID")
);

-- CreateTable
CREATE TABLE "courseContent" (
    "ContentID" SERIAL NOT NULL,
    "CourseID" INTEGER NOT NULL,
    "ContentType" TEXT NOT NULL,
    "Content" TEXT NOT NULL,
    "VideoURL" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "courseContent_pkey" PRIMARY KEY ("ContentID")
);

-- CreateTable
CREATE TABLE "enrollment" (
    "EnrollmentID" SERIAL NOT NULL,
    "UserID" INTEGER NOT NULL,
    "CourseID" INTEGER NOT NULL,
    "EnrollmentDate" TIMESTAMP(3) NOT NULL,
    "CompletionStatus" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "enrollment_pkey" PRIMARY KEY ("EnrollmentID")
);

-- CreateTable
CREATE TABLE "payment" (
    "PaymentID" SERIAL NOT NULL,
    "UserID" INTEGER NOT NULL,
    "PaymentDate" TIMESTAMP(3) NOT NULL,
    "Amount" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "PaymentMethod" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "payment_pkey" PRIMARY KEY ("PaymentID")
);

-- CreateTable
CREATE TABLE "quiz" (
    "QuizID" SERIAL NOT NULL,
    "CourseID" INTEGER NOT NULL,
    "QuizName" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "TotalMarks" INTEGER NOT NULL,

    CONSTRAINT "quiz_pkey" PRIMARY KEY ("QuizID")
);

-- CreateTable
CREATE TABLE "result" (
    "ResultID" SERIAL NOT NULL,
    "UserID" INTEGER NOT NULL,
    "CourseID" INTEGER NOT NULL,
    "QuizID" INTEGER NOT NULL,
    "Score" INTEGER NOT NULL,

    CONSTRAINT "result_pkey" PRIMARY KEY ("ResultID")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_UserName_key" ON "users"("UserName");

-- AddForeignKey
ALTER TABLE "courseContent" ADD CONSTRAINT "courseContent_CourseID_fkey" FOREIGN KEY ("CourseID") REFERENCES "course"("CourseID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollment" ADD CONSTRAINT "enrollment_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "users"("UserId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollment" ADD CONSTRAINT "enrollment_CourseID_fkey" FOREIGN KEY ("CourseID") REFERENCES "course"("CourseID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "users"("UserId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz" ADD CONSTRAINT "quiz_CourseID_fkey" FOREIGN KEY ("CourseID") REFERENCES "course"("CourseID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "result" ADD CONSTRAINT "result_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "users"("UserId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "result" ADD CONSTRAINT "result_CourseID_fkey" FOREIGN KEY ("CourseID") REFERENCES "course"("CourseID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "result" ADD CONSTRAINT "result_QuizID_fkey" FOREIGN KEY ("QuizID") REFERENCES "quiz"("QuizID") ON DELETE RESTRICT ON UPDATE CASCADE;
