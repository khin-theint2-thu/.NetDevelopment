USE [FoodReviewsDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckAccountExist]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckAccountExist]
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID,UserName,Email,Password,UserRole,UserImage 
	FROM FoodReviewsDB..tblUsers 
	WHERE UserName=@UserName;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCategory]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateCategory]
	-- Add the parameters for the stored procedure here
	@RestaurantID int,
	@CategoryName nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		INSERT INTO tblCategory
		(	[RestaurantID],
			[CategoryName]
		)
		VALUES
		(	@RestaurantID,
			@CategoryName
		)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateMenu]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateMenu]
	-- Add the parameters for the stored procedure here
	@MenuID int,
	@CategoryID int,
	@RestaurantID int,
	@MenuName nvarchar(50),
	@Price decimal(18,2),
	@MenuImage nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF Not EXISTS(Select MenuID from tblMenu where MenuID=@MenuID)
	BEGIN	
		INSERT INTO tblMenu
		(	[CategoryID],
			[RestaurantID],
			[MenuName],
			[Price],
			[MenuImage]
		)
		VALUES
		(	@CategoryID,
			@RestaurantID,
			@MenuName,
			@Price,
			@MenuImage
		)
		END
			ELSE
				BEGIN	
		UPDATE tblMenu
		SET
			CategoryID = @CategoryID,
			MenuName = @MenuName,
			Price = @Price,
			MenuImage = @MenuImage
			WHERE RestaurantID=@RestaurantID AND MenuID=@MenuID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreatePost]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreatePost]
	-- Add the parameters for the stored procedure here
	@PostTitle nvarchar(max),
	@PostImage nvarchar(max),
	@PostContent nvarchar(max),
	@PostType nvarchar(500),
	@PostedBy int,
	@PostedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		INSERT INTO tblPosts
		(	[PostTitle],
			[PostContent],
			[PostType],
			[PostImage],
			[PostedBy],
			[PostedDate]
		)
		VALUES
		(
			@PostTitle,
			@PostContent,
			@PostType,
			@PostImage,
			@PostedBy,
			@PostedDate
		)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateRestaurant]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateRestaurant]
	-- Add the parameters for the stored procedure here
	@RestaurantID int,
	@Name nvarchar(max),
	@Location nvarchar(max),
	@Township nvarchar(max),
	@Features nvarchar(max),
	@Cuisine nvarchar(max),
	@PriceRangeFrom nvarchar(20),
	@PriceRangeTo nvarchar(20),
	@RestaurantType nvarchar(50),
	@OpenHour time,
	@CloseHour time,
	@Tel nvarchar(20),
	@Website nvarchar(max),
	@UploadFile nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF Not EXISTS(Select RestaurantID from tblRestaurants where RestaurantID=@RestaurantID)
	BEGIN
		INSERT INTO tblRestaurants
		(	
			[Name],
			[Location],
			[Township],
			[Features],
			[Cuisine],
			[PriceRangeFrom],
			[PriceRangeTo],
			[RestaurantType],
			[OpenHour],
			[CloseHour],
			[Tel],
			[Website],
			[UploadFile],
			[CreatedDate],
			[LastUpdatedDate]
		)
		VALUES
		(
			
			@Name,
			@Location,
			@Township,
			@Features,
			@Cuisine,
			@PriceRangeFrom,
			@PriceRangeTo,
			@RestaurantType,
			@OpenHour,
			@CloseHour,
			@Tel,
			@Website,
			@UploadFile,
			GETDATE(),
			GETDATE()
		)
		END
			ELSE
				BEGIN	
		UPDATE tblRestaurants
		SET
			Name = @Name,
			Location = @Location,
			Township = @Township,
			Features = @Features,
			Cuisine =	@Cuisine,
			[PriceRangeFrom] = @PriceRangeFrom,
			[PriceRangeTo] = @PriceRangeTo,
			[RestaurantType] = @RestaurantType,
			OpenHour = @OpenHour,
			CloseHour = @CloseHour,
			Tel = @Tel,
			Website = @Website,
			UploadFile = @UploadFile,
			LastUpdatedDate=GETDATE()
			WHERE RestaurantID=@RestaurantID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateReview]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateReview]
	-- Add the parameters for the stored procedure here
	@RestaurantID int,
	@Review nvarchar(max),
	@Title nvarchar(50),
	@FoodRating nvarchar(50),
	@ServiceRating nvarchar(50),
	@CleanlinessRating nvarchar(50),
	@OverallRating nvarchar(50),
	@CreatedUserID int,
	@CreatedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		INSERT INTO tblReviews
		(	[RestaurantID],
		    [Title],
			[Review],
			[FoodRating],
			[ServiceRating],
			[CleanlinessRating],
			[OverallRating],
			[CreatedUserID],
			[CreatedDate]
		)
		VALUES
		(
			@RestaurantID,
			@Title,
			@Review,
			@FoodRating,
			@ServiceRating,
			@CleanlinessRating,
			@OverallRating,
			@CreatedUserID,
			@CreatedDate		
		)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateUserAccount]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateUserAccount]
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50),
	@Email nvarchar(50),
	@Password nvarchar(50),
	@UserRole nvarchar(50),
	@UserImage nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		INSERT INTO tblUsers
		(	[UserName],
			[Email],
			[Password],
			[UserRole],
			[UserImage]
		)
		VALUES
		(
			@UserName,
			@Email,
			@Password,
			@UserRole,
			@UserImage
		)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMenu]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteMenu]
	-- Add the parameters for the stored procedure here
	@MenuID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete FROM FoodReviewsDB..tblMenu WHERE MenuID=@MenuID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRestaurant]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteRestaurant]
	-- Add the parameters for the stored procedure here
	@RestaurantID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete FROM FoodReviewsDB..tblMenu WHERE RestaurantID=@RestaurantID;
	Delete FROM FoodReviewsDB..tblCategory WHERE RestaurantID=@RestaurantID;
	Delete FROM FoodReviewsDB..tblRestaurants WHERE RestaurantID=@RestaurantID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditMenu]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EditMenu]
	-- Add the parameters for the stored procedure here
	@MenuID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MenuName,Price,CategoryID ,MenuImage 
	FROM FoodReviewsDB..tblMenu 
	WHERE MenuID=@MenuID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCategories]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllCategories]
	-- Add the parameters for the stored procedure here
	@RestaurantID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryID,CategoryName,(SELECT Count(*) FROM tblMenu WHERE tblCategory.CategoryID=tblMenu.CategoryID) AS TotalMenuCount 
	FROM FoodReviewsDB..tblCategory
	WHERE RestaurantID=@RestaurantID
	ORDER BY CategoryID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCuisines]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllCuisines]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Name,Image
	FROM FoodReviewsDB..tblCuisine
	ORDER BY Name ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllFeatures]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllFeatures]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Name,(SELECT Count(*) FROM tblRestaurants WHERE tblRestaurants.Features like '%'+tblFeatures.Name+'%') AS TotalRestaurantCount 
	FROM FoodReviewsDB..tblFeatures
	ORDER BY Id ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMenuList]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllMenuList]
	-- Add the parameters for the stored procedure here
	@RestaurantID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MenuID,CategoryID,(SELECT CategoryName FROM tblCategory WHERE tblCategory.CategoryID=tblMenu.CategoryID)AS CategoryName,MenuName,Price,MenuImage FROM FoodReviewsDB..tblMenu where RestaurantID=@RestaurantID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMenuListByCategory]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllMenuListByCategory]
	-- Add the parameters for the stored procedure here
	@CategoryID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MenuID,CategoryID,(SELECT CategoryName FROM tblCategory WHERE tblCategory.CategoryID=tblMenu.CategoryID)AS CategoryName,MenuName,Price 
	FROM FoodReviewsDB..tblMenu 
	WHERE CategoryID=@CategoryID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllRestaurantTypes]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllRestaurantTypes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name,(SELECT Count(*) FROM tblRestaurants WHERE tblRestaurants.RestaurantType=tblRestaurantType.Name) AS TotalRestaurantCount 
	FROM FoodReviewsDB..tblRestaurantType
	ORDER BY Name ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllTownships]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllTownships]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT Township,(SELECT Count(*) FROM tblRestaurants WHERE tblRestaurants.Township=tblTownship.Township) AS TotalRestaurantCount 
	FROM FoodReviewsDB..tblTownship
	ORDER BY Township ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMenuListing]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMenuListing]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT RestaurantID, (SELECT Name FROM tblRestaurants WHERE RestaurantID=tblRestaurants.RestaurantID) AS RestaurantName,
MenuName,(SELECT CategoryName FROM tblCategory WHERE CategoryID=tblMenu.CategoryID) AS CategoryName,
Price FROM tblMenu
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRestaurantDetail]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRestaurantDetail]
	-- Add the parameters for the stored procedure here
	@RestaurantID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name,Location,Township,PriceRangeFrom,PriceRangeTo,RestaurantType,Features,Cuisine,OpenHour,CloseHour,Tel,Website,UploadFile 
	FROM FoodReviewsDB..tblRestaurants 
	WHERE RestaurantID=@RestaurantID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRestaurantsByCustomPaging]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRestaurantsByCustomPaging]
	-- Add the parameters for the stored procedure here
	@PageSize Int,
	@PageIndex Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY CreatedDate DESC) AS RowNum,RestaurantID,CreatedDate, Name,Location,
	Township,PriceRangeFrom,PriceRangeTo,RestaurantType,Features,Cuisine,OpenHour,CloseHour,Tel,Website,UploadFile,
	(SELECT Count(ID) FROM tblReviews WHERE tblRestaurants.RestaurantID=tblReviews.RestaurantID) AS TotalReviews ,
	(SELECT avg(OverallRating) FROM tblReviews WHERE tblRestaurants.RestaurantID=tblReviews.RestaurantID) AS OverallRating 
	FROM FoodReviewsDB..tblRestaurants ) Restaurant
	WHERE Restaurant.RowNum BETWEEN (@PageSize*(@PageIndex-1))+1 AND (@PageSize*(@PageIndex-1))+@PageSize;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRestsByCustomPagingAndTwnship]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRestsByCustomPagingAndTwnship]
	-- Add the parameters for the stored procedure here
	@PageSize Int,
	@PageIndex Int,
	@Township nvarchar(max) = null,
	@Filter nvarchar(max) = null,
	@SortBy nvarchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY CreatedDate DESC) AS RowNum,RestaurantID,CreatedDate,
	Name,Location,Township,PriceRangeFrom,PriceRangeTo,RestaurantType,Features,Cuisine,OpenHour,CloseHour,
	Tel,Website,UploadFile,(SELECT Count(ID) FROM tblReviews WHERE tblRestaurants.RestaurantID= tblReviews.RestaurantID) AS TotalReviews,
	(SELECT avg(OverallRating) FROM tblReviews WHERE tblRestaurants.RestaurantID=tblReviews.RestaurantID) AS OverallRating 
	FROM FoodReviewsDB..tblRestaurants WHERE Township = @Township OR Coalesce(@Township,'') = '' And( Name like '%'+Coalesce(@Filter,'')+'%' or Cuisine like '%'+Coalesce(@Filter,'')+'%' or Features like '%'+Coalesce(@Filter,'')+'%' )) Restaurant
	WHERE Restaurant.RowNum BETWEEN (@PageSize*(@PageIndex-1))+1 AND (@PageSize*(@PageIndex-1))+@PageSize
	ORDER BY
        CASE
           WHEN @SortBy = 'Review' THEN TotalReviews
           WHEN @SortBy = 'Restaurant' THEN OverallRating
    END DESC, 
        CASE WHEN @SortBy = 'Price' THEN PriceRangeFrom
    END ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReviewsByCustomPaging]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint
-- Create date: 12/12/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetReviewsByCustomPaging]
	-- Add the parameters for the stored procedure here
	@PageSize Int,
	@PageIndex Int,
	@RestaurantID Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from(SELECT ROW_NUMBER() OVER (ORDER BY CreatedDate DESC) AS RowNum,Review,RestaurantID,Title,OverallRating,(SELECT UserName FROM tblUsers WHERE CreatedUserID = tblUsers.UserID) AS CreatedUserName,(SELECT UserImage FROM tblUsers WHERE CreatedUserID = tblUsers.UserID) as CreatedUserProfile,CreatedDate
	FROM FoodReviewsDB..tblReviews WHERE  RestaurantID = @RestaurantID) Review
	WHERE Review.RowNum BETWEEN (@PageSize*(@PageIndex-1))+1 AND (@PageSize*(@PageIndex-1))+@PageSize
	ORDER BY CreatedDate DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRestaurant]    Script Date: 8/23/2021 8:34:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khin Theint 
-- Create date: <28/11/2020>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[sp_UpdateRestaurant]
	-- Add the parameters for the stored procedure here
	@RestaurantID int,
	@Name nvarchar(max),
	@Location nvarchar(max),
	@Township nvarchar(max),
	@Features nvarchar(max),
	@Cuisine nvarchar(max),
	@PriceRangeFrom nvarchar(20),
	@PriceRangeTo nvarchar(20),
	@RestaurantType nvarchar(50),
	@OpenHour time,
	@CloseHour time,
	@Tel nvarchar(20),
	@Website nvarchar(max),
	@UploadFile nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN
		UPDATE tblRestaurants
		SET
			Name = @Name,
			Location = @Location,
			Township = @Township,
			Features = @Features,
			Cuisine =	@Cuisine,
			[PriceRangeFrom] = @PriceRangeFrom,
			[PriceRangeTo] = @PriceRangeTo,
			[RestaurantType] = @RestaurantType,
			OpenHour = @OpenHour,
			CloseHour = @CloseHour,
			Tel = @Tel,
			Website = @Website,
			UploadFile = @UploadFile,
			LastUpdatedDate=GETDATE()
			WHERE RestaurantID=@RestaurantID
		END			
END
GO
