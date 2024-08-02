-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Công_dụng với kiểm tra mã mẫu và sự trùng lặp
CREATE PROCEDURE sp_InsertCông_dụng
    @Mã_CD NVARCHAR(10),
    @Tên_CD NVARCHAR(100)
AS
BEGIN
    -- Kiểm tra mã công dụng theo mẫu MC000
    IF @Mã_CD NOT LIKE 'MC[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã công dụng không đúng mẫu MC000.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra sự trùng lặp mã công dụng
    IF EXISTS (SELECT 1 FROM Công_dụng WHERE Mã_CD = @Mã_CD)
    BEGIN
        RAISERROR('Mã công dụng đã tồn tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Công_dụng
    INSERT INTO Công_dụng (Mã_CD, Tên_CD)
    VALUES (@Mã_CD, @Tên_CD);
END;

exec sp_InsertCông_dụng 'MC001','Trị' 

select * from Công_dụng
-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Đối_tượng_sử_dụng với kiểm tra mã mẫu và sự trùng lặp
CREATE PROCEDURE sp_InsertĐối_tượng_sử_dụng
    @Mã_DT NVARCHAR(10),
    @Tên_DT NVARCHAR(100)
AS
BEGIN
    -- Kiểm tra mã đối tượng sử dụng theo mẫu MD000
    IF @Mã_DT NOT LIKE 'MD[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã đối tượng sử dụng không đúng mẫu MD000.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra sự trùng lặp mã đối tượng sử dụng
    IF EXISTS (SELECT 1 FROM Đối_tượng_sử_dụng WHERE Mã_DT = @Mã_DT)
    BEGIN
        RAISERROR('Mã đối tượng sử dụng đã tồn tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Đối_tượng_sử_dụng
    INSERT INTO Đối_tượng_sử_dụng (Mã_DT, Tên_DT)
    VALUES (@Mã_DT, @Tên_DT);
END;

exec sp_InsertĐối_tượng_sử_dụng 'MC001','Trị' 

-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Loại_thuốc với kiểm tra mã mẫu và sự trùng lặp
CREATE PROCEDURE sp_InsertLoại_thuốc
    @Mã_Loại NVARCHAR(10),
    @Tên_Loại NVARCHAR(100)
AS
BEGIN
    -- Kiểm tra mã loại thuốc theo mẫu MT000
    IF @Mã_Loại NOT LIKE 'MT[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã loại thuốc không đúng mẫu MT000.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra sự trùng lặp mã loại thuốc
    IF EXISTS (SELECT 1 FROM Loại_thuốc WHERE Mã_Loại = @Mã_Loại)
    BEGIN
        RAISERROR('Mã loại thuốc đã tồn tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Loại_thuốc
    INSERT INTO Loại_thuốc (Mã_Loại, Tên_Loại)
    VALUES (@Mã_Loại, @Tên_Loại);
END;

exec sp_InsertLoại_thuốc 'MC001','Trị' 
-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Khách_Hàng với kiểm tra mã khách hàng không bị trùng
CREATE PROCEDURE sp_InsertKhách_Hàng
    @Mã_KH NVARCHAR(10),
    @Tên_KH NVARCHAR(50),
    @SDT CHAR(10)
AS
BEGIN
    -- Kiểm tra sự trùng lặp mã khách hàng
    IF EXISTS (SELECT 1 FROM Khách_Hàng WHERE Mã_KH = @Mã_KH)
    BEGIN
        RAISERROR('Mã khách hàng đã tồn tại.', 16, 1);
        RETURN;
    END;

	-- Kiểm tra mã loại thuốc theo mẫu MT000
    IF @Mã_KH NOT LIKE 'KH[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã khách hàng không đúng mẫu KH000.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Khách_Hàng
    INSERT INTO Khách_Hàng (Mã_KH, Tên_KH, SDT)
    VALUES (@Mã_KH, @Tên_KH, @SDT);
END;

exec sp_InsertKhách_Hàng 'MC001','Trị' ,123123

--Thêm thuốc
CREATE PROCEDURE sp_InsertThuốc
    @Mã_Thuốc NVARCHAR(10),
    @Tên_thuốc NVARCHAR(100),
    @Mã_Loại NVARCHAR(10),
    @Mã_CD NVARCHAR(10),
    @Mã_DT NVARCHAR(10),
    @Mã_TH NVARCHAR(10),
    @Nơi_sản_xuất NVARCHAR(50),
    @Mã_BC NVARCHAR(10),
    @Mã_DG NVARCHAR(10),
    @Mã_NCC NVARCHAR(10),
    @Hạn_sử_dụng NVARCHAR(50),
    @Số_lượng_còn INT
AS
BEGIN
    -- Kiểm tra Mã thuốc phải có định dạng MT000
    IF @Mã_Thuốc NOT LIKE 'MT[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã thuốc không hợp lệ.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã thuốc không được trùng
    IF EXISTS (SELECT 1 FROM Thuốc WHERE Mã_Thuốc = @Mã_Thuốc)
    BEGIN
        RAISERROR('Mã thuốc đã tồn tại.', 16, 1);
        RETURN;
    END;

	-- Kiểm tra Mã Loại phải tồn tại trong bảng Loại_thuốc
    IF NOT EXISTS (SELECT 1 FROM Loại_thuốc WHERE Mã_Loại = @Mã_Loại)
    BEGIN
        RAISERROR('Mã loại không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã CD phải tồn tại trong bảng Công_dụng
    IF NOT EXISTS (SELECT 1 FROM Công_dụng WHERE Mã_CD = @Mã_CD)
    BEGIN
        RAISERROR('Mã công dụng không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã DT phải tồn tại trong bảng Đối_tượng_sử_dụng
    IF NOT EXISTS (SELECT 1 FROM Đối_tượng_sử_dụng WHERE Mã_DT = @Mã_DT)
    BEGIN
        RAISERROR('Mã đối tượng không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã TH phải tồn tại trong bảng Thương_hiệu
    IF NOT EXISTS (SELECT 1 FROM Thương_hiệu WHERE Mã_TH = @Mã_TH)
    BEGIN
        RAISERROR('Mã thương hiệu không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã BC phải tồn tại trong bảng Dạng_bào_chế
    IF NOT EXISTS (SELECT 1 FROM Dạng_bào_chế WHERE Mã_BC = @Mã_BC)
    BEGIN
        RAISERROR('Mã dạng bào chế không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã DG phải tồn tại trong bảng Cách_đóng_gói
    IF NOT EXISTS (SELECT 1 FROM Cách_đóng_gói WHERE Mã_DG = @Mã_DG)
    BEGIN
        RAISERROR('Mã cách đóng gói không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã NCC phải tồn tại trong bảng Nhà_Cung_Cấp
    IF NOT EXISTS (SELECT 1 FROM Nhà_Cung_Cấp WHERE Mã_NCC = @Mã_NCC)
    BEGIN
        RAISERROR('Mã nhà cung cấp không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Số lượng phải >= 0
    IF @Số_lượng_còn < 0
    BEGIN
        RAISERROR('Số lượng phải lớn hơn hoặc bằng 0.', 16, 1);
        RETURN;
    END;

	 DECLARE @NumberOfMonths INT
     IF NOT (LEN(@Hạn_sử_dụng ) >= 8 AND LEN(@Hạn_sử_dụng) <= 11 AND @Hạn_sử_dụng LIKE '[0-9]% tháng')
  BEGIN
    RAISERROR('Invalid format for Hạn sử dụng. Please use the format "0-1000 tháng".', 16, 1)
    RETURN
  END

  SET @NumberOfMonths = CONVERT(INT, SUBSTRING(@Hạn_sử_dụng, 1, CHARINDEX(' tháng', @Hạn_sử_dụng) - 1))

  IF @NumberOfMonths < 0 OR @NumberOfMonths > 1000
  BEGIN
    RAISERROR('Invalid number of months for Hạn sử dụng. Please enter a value between 0 and 1000.', 16, 1)
    RETURN
  END


    -- Chèn dữ liệu vào bảng Thuốc
    INSERT INTO Thuốc (Mã_Thuốc, Tên_thuốc, Mã_Loại, Mã_CD, Mã_DT, Mã_TH, Nơi_sản_xuất, Mã_BC, Mã_DG, Mã_NCC, Hạn_sử_dụng, _Số_lượng_còn)
    VALUES (@Mã_Thuốc, @Tên_thuốc, @Mã_Loại, @Mã_CD, @Mã_DT, @Mã_TH, @Nơi_sản_xuất, @Mã_BC, @Mã_DG, @Mã_NCC, @Hạn_sử_dụng, @Số_lượng_còn);
END;

exec sp_InsertThuốc 'MT001','Test','ML001','MC001','MT001','MTH001','Việt Nam','MC001','MD001','NCC01','12 tháng',5

-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Biến_động_giá với kiểm tra mã thuốc tồn tại, giá không để trống và > 10000, mã biến động không trùng
CREATE PROCEDURE sp_InsertBiến_động_giá
    @Mã_BĐ NVARCHAR(10),
    @Mã_Thuốc NVARCHAR(10),
    @Giá_BĐ INT,
    @Ngày_BĐ DATE
AS
BEGIN
    -- Kiểm tra mã thuốc tồn tại
    IF NOT EXISTS (SELECT 1 FROM Thuốc WHERE Mã_Thuốc = @Mã_Thuốc)
    BEGIN
        RAISERROR('Mã thuốc không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra giá không để trống và > 10000
    IF @Giá_BĐ IS NULL OR @Giá_BĐ <= 10000
    BEGIN
        RAISERROR('Giá biến động không hợp lệ.', 16, 1);
        RETURN;
    END;
	IF @Mã_BĐ NOT LIKE 'BD[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã biến động không đúng mẫu BD000.', 16, 1);
        RETURN;
    END;
    -- Kiểm tra mã biến động không trùng
    IF EXISTS (SELECT 1 FROM Biến_động_giá WHERE Mã_BĐ = @Mã_BĐ)
    BEGIN
        RAISERROR('Mã biến động đã tồn tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Biến_động_giá
    INSERT INTO Biến_động_giá (Mã_BĐ, Mã_Thuốc, Giá_BĐ, Ngày_BĐ)
    VALUES (@Mã_BĐ, @Mã_Thuốc, @Giá_BĐ, @Ngày_BĐ);
END;

exec sp_InsertBiến_động_giá 'MBD001','MT001',100000,'2022-10-9'

-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Hóa_Đơn với kiểm tra số HD không trùng, mã KH tồn tại, tổng tiền NULL và ngày không quá ngày hiện tại
CREATE PROCEDURE sp_InsertHóa_Đơn
    @Số_HD NVARCHAR(10),
    @Mã_KH NVARCHAR(10),
    @Ngày_Bán DATE
AS
BEGIN
	
	IF @Số_HD NOT LIKE 'HD[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã hóa đơn không đúng mẫu HD000.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra số HD không trùng
    IF EXISTS (SELECT 1 FROM Hóa_Đơn WHERE Số_HD = @Số_HD)
    BEGIN
        RAISERROR('Số hóa đơn đã tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra mã KH tồn tại trong bảng Khách_Hàng
    IF NOT EXISTS (SELECT 1 FROM Khách_Hàng WHERE Mã_KH = @Mã_KH)
    BEGIN
        RAISERROR('Mã khách hàng không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra ngày không quá ngày hiện tại
    IF @Ngày_Bán > GETDATE()
    BEGIN
        RAISERROR('Ngày bán không được lớn hơn ngày hiện tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Hóa_Đơn
    INSERT INTO Hóa_Đơn (Số_HD, Mã_KH, Ngày_Bán)
    VALUES (@Số_HD, @Mã_KH, @Ngày_Bán);

END;

exec sp_InsertHóa_Đơn 'HD001','KH001','2023-12-12'

--Thêm chi tiết hóa đơn
CREATE PROCEDURE sp_ThêmChiTiếtHóaĐơn
    @Số_HD NVARCHAR(10),
    @Mã_Thuốc NVARCHAR(10),
    @Số_Lượng INT
AS
BEGIN
    DECLARE @Đơn_giá INT;

    -- Kiểm tra Số HD phải tồn tại trong bảng Hóa_Đơn
    IF NOT EXISTS (SELECT 1 FROM Hóa_Đơn WHERE Số_HD = @Số_HD)
    BEGIN
        RAISERROR('Số hóa đơn không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã Thuốc phải tồn tại trong bảng Thuốc
    IF NOT EXISTS (SELECT 1 FROM Thuốc WHERE Mã_Thuốc = @Mã_Thuốc)
    BEGIN
        RAISERROR('Mã thuốc không tồn tại.', 16, 1);
        RETURN;
    END;
  

    -- Kiểm tra Số lượng phải >= 0
    IF @Số_Lượng < 0
    BEGIN
        RAISERROR('Số lượng phải lớn hơn hoặc bằng 0.', 16, 1);
        RETURN;
    END;

    IF @Số_Lượng <= 0 OR @Số_Lượng > 50
  BEGIN
    RAISERROR('Invalid Số_Lượng. It should be greater than 0 and not more than 50.', 16, 1)
    RETURN
  END

  -- Check if the Số_Lượng_còn of the Thuốc is sufficient
  DECLARE @SoLuongCon INT
  SELECT @SoLuongCon = _Số_lượng_còn FROM Thuốc WHERE Mã_Thuốc = @Mã_Thuốc

  IF @Số_Lượng > @SoLuongCon
  BEGIN
    RAISERROR('Không đủ số lượng thuốc để thêm vào hóa đơn.', 16, 1)
    RETURN
  END

  BEGIN TRY
    -- Calculate the Tổng_Tiền based on the most recent Giá_BĐ for the Mã_Thuốc
    DECLARE @GiaBD INT
    SELECT TOP 1 @GiaBD = Giá_BĐ FROM Biến_động_giá WHERE Mã_Thuốc = @Mã_Thuốc ORDER BY Ngày_BĐ DESC

    IF @GiaBD IS NULL
    BEGIN
      RAISERROR('Không tìm thấy giá biến động cho Mã_Thuốc này.', 16, 1)
      RETURN
    END

    DECLARE @TongTien INT
    SET @TongTien = @Số_Lượng * @GiaBD

    -- Insert the new record into Chi_tiết_hóa_đơn table
    INSERT INTO Chi_tiết_hóa_đơn (Số_HD, Mã_Thuốc, Số_Lượng)
    VALUES (@Số_HD, @Mã_Thuốc, @Số_Lượng)

    -- Update the Số_lượng_còn in the Thuốc table
    UPDATE Thuốc SET _Số_lượng_còn = _Số_lượng_còn - @Số_Lượng WHERE Mã_Thuốc = @Mã_Thuốc

    -- Update the Tổng_Tiền in the Hóa_Đơn table
    UPDATE Hóa_Đơn SET Tổng_Tiền = Tổng_Tiền + @TongTien WHERE Số_HD = @Số_HD

    PRINT N'Chi tiết hóa đơn đã được thêm thành công.'
  END TRY
  BEGIN CATCH
    -- Handle any errors that occurred during the insertion and update process
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
    RAISERROR(@ErrorMessage, 16, 1)
  END CATCH
   
END;

exec sp_ThêmChiTiếtHóaĐơn 'HD010','MT002',5

-- Tạo stored procedure cho việc chèn dữ liệu vào bảng Thanh_toán _Hóa_Đơn
CREATE PROCEDURE sp_InsertThanh_Toán_HD
    @Số_HD NVARCHAR(10),
    @Mã_NV NVARCHAR(10),
    @Tiền_TT INT,
    @Hình_thức_TT NVARCHAR(30),
    @Ngày_thanh_toán DATE
AS
BEGIN
    -- Kiểm tra Số HD phải có trong bảng Hóa Đơn
    IF NOT EXISTS (SELECT 1 FROM Hóa_Đơn WHERE Số_HD = @Số_HD)
    BEGIN
        RAISERROR('Số hóa đơn không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã NV phải tồn tại trong bảng Nhân Viên
    IF NOT EXISTS (SELECT 1 FROM Nhân_Viên WHERE Mã_NV = @Mã_NV)
    BEGIN
        RAISERROR('Mã nhân viên không tồn tại.', 16, 1);
        RETURN;
    END;

	-- Kiểm tra 
    IF EXISTS (SELECT 1 FROM Thanh_Toán_HD WHERE Số_HD = @Số_HD)
    BEGIN
        RAISERROR('Số HD đã thanh toán.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Tiền TT >= tổng tiền của hóa đơn
    DECLARE @Tổng_Tiền INT;
    SELECT @Tổng_Tiền = Tổng_Tiền
    FROM Hóa_Đơn
    WHERE Số_HD = @Số_HD;

    IF @Tiền_TT < @Tổng_Tiền
    BEGIN
        RAISERROR('Tiền thanh toán phải lớn hơn hoặc bằng tổng tiền của hóa đơn.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Hình thức TT phải là 'Tiền mặt' hoặc 'Thẻ'
    IF @Hình_thức_TT NOT IN ('Tiền mặt', 'Thẻ')
    BEGIN
        RAISERROR('Hình thức thanh toán không hợp lệ.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra và tính toán tiền thừa
    DECLARE @Tiền_thừa INT;
    IF @Hình_thức_TT = 'Tiền mặt'
    BEGIN
        SET @Tiền_thừa = @Tiền_TT - @Tổng_Tiền;
    END
    ELSE IF @Hình_thức_TT = 'Thẻ'
    BEGIN
        SET @Tiền_thừa = 0;
    END;

    -- Kiểm tra ngày không quá ngày hiện tại
    IF @Ngày_thanh_toán > GETDATE()
    BEGIN
        RAISERROR('Ngày thanh toán không được lớn hơn ngày hiện tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Thanh_Toán_HD
    INSERT INTO Thanh_Toán_HD (Số_HD, Mã_NV, Tiền_TT, Hình_thức_TT, Tiền_thừa, Ngày_thanh_toán)
    VALUES (@Số_HD, @Mã_NV, @Tiền_TT, @Hình_thức_TT, @Tiền_thừa, @Ngày_thanh_toán);
END;

exec sp_InsertThanh_Toán_HD 'HD010','NV001',10000,'The','2023-12-12'

--Thếm phiếu nhập
CREATE PROCEDURE sp_ThêmPhiếuNhập
    @Số_PN NVARCHAR(10),
    @Mã_NCC NVARCHAR(10),
    @Ngày_Nhập DATE
AS
BEGIN

	IF @Số_PN NOT LIKE 'PN[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã phiếu nhập không đúng mẫu PN000.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Số PN phải không trùng
    IF EXISTS (SELECT 1 FROM Phiếu_Nhập WHERE Số_PN = @Số_PN)
    BEGIN
        RAISERROR('Số phiếu nhập đã tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã NCC phải tồn tại trong bảng Nhà_Cung_Cấp
    IF NOT EXISTS (SELECT 1 FROM Nhà_Cung_Cấp WHERE Mã_NCC = @Mã_NCC)
    BEGIN
        RAISERROR('Mã nhà cung cấp không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra ngày không quá ngày hiện tại
    IF @Ngày_Nhập > GETDATE()
    BEGIN
        RAISERROR('Ngày nhập không được lớn hơn ngày hiện tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Phiếu_Nhập
    INSERT INTO Phiếu_Nhập (Số_PN, Mã_NCC, Tổng_Tiền, Ngày_Nhập)
    VALUES (@Số_PN, @Mã_NCC, NULL, @Ngày_Nhập);
END;

exec sp_ThêmPhiếuNhập 'PM001','NCC001','2023-12-12'

--
CREATE PROCEDURE sp_ThêmChiTiếtPhiếuNhập
    @Số_PN NVARCHAR(10),
    @Mã_Thuốc NVARCHAR(10),
    @Số_Lượng INT,
    @Đơn_giá INT
AS
BEGIN

	DECLARE @CanUpdate BIT = 1;

    -- Kiểm tra Số PN phải tồn tại trong bảng Phiếu_Nhập
    IF NOT EXISTS (SELECT 1 FROM Phiếu_Nhập WHERE Số_PN = @Số_PN)
    BEGIN
        RAISERROR('Số phiếu nhập không tồn tại.', 16, 1);
        RETURN;
    END;

	 -- Kiểm tra Mã thuốc phải có định dạng MT000
    IF @Mã_Thuốc NOT LIKE 'MT[0-9][0-9][0-9]'
    BEGIN
        RAISERROR('Mã thuốc không hợp lệ.', 16, 1);
        RETURN;
    END;
	if exists (Select 1 from Chi_tiết_phiếu_nhập where Số_PN = @Số_PN and Mã_Thuốc = @Mã_Thuốc)
	begin
	set @CanUpdate = 0;
	end
    -- Kiểm tra đơn giá phải > 0
    IF @Đơn_giá <= 0
    BEGIN
        RAISERROR('Đơn giá phải lớn hơn 0.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Số lượng phải >= 0
    IF @Số_Lượng < 0
    BEGIN
        RAISERROR('Số lượng phải lớn hơn hoặc bằng 0.', 16, 1);
        RETURN;
    END;

	 IF @CanUpdate = 1
	BEGIN
        BEGIN TRANSACTION;
    -- Chèn dữ liệu vào bảng Chi_tiết_phiếu_nhập
    INSERT INTO Chi_tiết_phiếu_nhập (Số_PN, Mã_Thuốc, Số_lượng, Đơn_giá)
    VALUES (@Số_PN, @Mã_Thuốc, @Số_Lượng, @Đơn_giá);

	UPDATE Thuốc
    SET _Số_lượng_còn = _Số_lượng_còn + @Số_Lượng
    WHERE Mã_Thuốc = @Mã_Thuốc
    -- Cập nhật tổng tiền bên bảng Phiếu_Nhập
    UPDATE Phiếu_Nhập
    SET Tổng_Tiền = ISNULL(Tổng_Tiền, 0) + (@Số_Lượng * @Đơn_giá)
    WHERE Số_PN = @Số_PN;
	PRINT N'Thêm chi tiết phiếu nhập thành công.';
	COMMIT TRANSACTION;
    END;
	else 
	PRINT N'Thêm chi tiết phiếu nhập không thành công.';
END;

exec sp_ThêmChiTiếtPhiếuNhập 'PN001','MT001',10,10000

--
CREATE PROCEDURE sp_ThêmThanhToánPhiếuNhập
    @Số_PN NVARCHAR(10),
    @Mã_NV NVARCHAR(10),
    @Ngày_TT DATE
AS
BEGIN
    -- Kiểm tra Số PN phải tồn tại trong bảng Phiếu_Nhập
    IF NOT EXISTS (SELECT 1 FROM Phiếu_Nhập WHERE Số_PN = @Số_PN)
    BEGIN
        RAISERROR('Số phiếu nhập không tồn tại.', 16, 1);
        RETURN;
    END;

	-- Kiểm tra 
    IF EXISTS (SELECT 1 FROM Thanh_Toán_PN WHERE Số_PN = @Số_PN)
    BEGIN
        RAISERROR('Số PN đã thanh toán.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra Mã NV phải tồn tại trong bảng Nhân_Viên
    IF NOT EXISTS (SELECT 1 FROM Nhân_Viên WHERE Mã_NV = @Mã_NV)
    BEGIN
        RAISERROR('Mã nhân viên không tồn tại.', 16, 1);
        RETURN;
    END;

    -- Kiểm tra ngày TT không quá ngày hiện tại
    IF @Ngày_TT > GETDATE()
    BEGIN
        RAISERROR('Ngày thanh toán không được lớn hơn ngày hiện tại.', 16, 1);
        RETURN;
    END;

    -- Chèn dữ liệu vào bảng Thanh_Toán_PN
    INSERT INTO Thanh_Toán_PN (Số_PN, Mã_NV, Ngày_TT)
    VALUES (@Số_PN, @Mã_NV, @Ngày_TT);
END;


exec sp_InsertCông_dụng 'MC001','Trị' 
exec sp_InsertĐối_tượng_sử_dụng 'MC001','Trị' 
exec sp_InsertLoại_thuốc 'MC001','Trị' 
exec sp_InsertKhách_Hàng 'MC001','Trị' ,123123
exec sp_InsertThuốc 'MT001','Test','ML001','MC001','MT001','MTH001','Việt Nam','MC001','MD001','NCC01','12 tháng',5
exec sp_InsertBiến_động_giá 'MBD001','MT001',100000,'2022-10-9'
exec sp_InsertHóa_Đơn 'HD001','KH001','2023-12-12'
exec sp_ThêmChiTiếtHóaĐơn 'HD010','MT002',5
exec sp_InsertThanh_Toán_HD 'HD010','NV001',10000,'The','2023-12-12'
exec sp_ThêmPhiếuNhập 'PM001','NCC001','2023-12-12'
exec sp_ThêmChiTiếtPhiếuNhập 'PN001','MT001',10,10000
exec sp_ThêmThanhToánPhiếuNhập 'PN001','NV001','2023-12-12'

