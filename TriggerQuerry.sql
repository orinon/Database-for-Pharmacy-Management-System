--R1
CREATE TRIGGER tr_R01Nhanvien
ON Nhân_Viên 
for INSERT , UPDATE 
AS 
BEGIN
-- Dữ liệu mới được lưu trong inserted
DECLARE @gt nchar(100);
	SELECT @gt=Giới_tính FROM inserted;
-- Kiểm tra dữ liệu giới tính
	IF @gt <> N'Nam'  AND  @gt<>N'Nữ'
      BEGIN
                -- Khôi phục dữ liệu
                ROLLBACK Transaction
                -- Xuất thông báo lỗi
                RAISERROR('Giới tính phải là Nam hoặc Nữ', 16,1)
                RETURN
        END
END;

--R2
CREATE TRIGGER tr_R02Nhanvien
ON Nhân_Viên
FOR INSERT , UPDATE
AS
BEGIN 
DECLARE @tuoi int;
	Select @tuoi = Year(Ngày_sinh) from inserted;
	if  Year(Getdate()) -@tuoi <17
	Begin
		ROLLBACK Transaction
		RAISERROR('Số tuổi phải lớn hơn 17', 16,1)
        RETURN
	end
end

--R3
-- Tạo trigger kiểm tra hình thức thanh toán của hóa đơn
CREATE TRIGGER tr_R02HoaDon
ON Thanh_Toán_HD
FOR INSERT, UPDATE
AS 
BEGIN
    -- Dữ liệu mới được lưu trong inserted
    DECLARE @httt nvarchar(30);

    SELECT @httt = Hình_thức_TT FROM inserted;

    -- Kiểm tra dữ liệu hình thức thanh toán
    IF @httt NOT IN (N'Tiền mặt', N'Thẻ')
    BEGIN
        -- Xuất thông báo lỗi
        RAISERROR('Hình thức thanh toán phải là Tiền mặt hoặc Thẻ', 16, 1);
        ROLLBACK TRANSACTION; -- Không cho phép thực hiện giao dịch
        RETURN;
    END;
END;


--R4
create trigger tr_xoancc
on Nhà_Cung_cấp
for DELETE
as
begin
	declare @mancc char(10), @c int;
	select @mancc=Mã_NCC from deleted;
	select @c=count(*)
	from Phiếu_Nhập 
	where Mã_NCC=@mancc
	if @c>0 -- Có phiếu
	begin
		Rollback Transaction
		Raiserror(N'Không được xóa', 16,1)
		Return
	end
end
--
create trigger tr_themphieunhap1
on Phiếu_Nhập
for INSERT,UPDATE
as
begin
	declare @mancc char(10), @c int;
	select @mancc=Mã_NCC from inserted;
	select @c=count(*)
	from Nhà_Cung_cấp 
	where Mã_NCC=@mancc
	if @c<1
	begin
		Rollback Transaction
		Raiserror(N'Dữ liệu sai', 16,1)
		Return
	end
end

--R5
create trigger tr_xoakh
on Khách_hàng
for DELETE
as
begin
	declare @makh char(10), @c int;
	select @makh=Mã_KH from deleted;
	select @c=count(*)
	from Hóa_Đơn 
	where Mã_KH=@makh
	if @c>0 -- Có phiếu
	begin
		Rollback Transaction
		Raiserror(N'Không được xóa', 16,1)
		Return
	end
end
--
create trigger tr_themphieuxuat
on Hóa_Đơn
for UPDATE
as
begin
	declare @makh char(10), @c int;
	select @makh=Mã_KH from inserted;
	select @c=count(*)
	from Khách_Hàng 
	where Mã_KH=@makh
	if @c<1
	begin
		Rollback Transaction
		Raiserror(N'Dữ liệu sai', 16,1)
		Return
	end
end
--R6
-- Tạo trigger kiểm tra khi xóa dữ liệu từ các bảng Loại thuốc, Công dụng, Đối tượng, Thương hiệu, Dạng bào chế và Cách đóng gói

CREATE TRIGGER tr_CheckDelete_LoaiThuoc
ON Loại_thuốc
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d
               INNER JOIN Thuốc t ON t.Mã_Loại = d.Mã_Loại)
    BEGIN
        RAISERROR('Không thể xóa dữ liệu khi còn tồn tại trong bảng Thuốc.', 16, 1);
        ROLLBACK TRANSACTION; -- Không cho phép thực hiện giao dịch
        RETURN;
    END;
END;

CREATE TRIGGER tr_CheckDelete_CongDung
ON Công_dụng
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d
               INNER JOIN Thuốc t ON t.Mã_CD = d.Mã_CD)
    BEGIN
        RAISERROR('Không thể xóa dữ liệu khi còn tồn tại trong bảng Thuốc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;

CREATE TRIGGER tr_CheckDelete_DoiTuongSuDung
ON Đối_tượng_sử_dụng
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d
               INNER JOIN Thuốc t ON t.Mã_DT = d.Mã_DT)
    BEGIN
        RAISERROR('Không thể xóa dữ liệu khi còn tồn tại trong bảng Thuốc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;

CREATE TRIGGER tr_CheckDelete_ThuongHieu
ON Thương_hiệu
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d
               INNER JOIN Thuốc t ON t.Mã_TH = d.Mã_TH)
    BEGIN
        RAISERROR('Không thể xóa dữ liệu khi còn tồn tại trong bảng Thuốc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;

CREATE TRIGGER tr_CheckDelete_DangBaoChe
ON Dạng_bào_chế
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d
               INNER JOIN Thuốc t ON t.Mã_BC = d.Mã_BC)
    BEGIN
        RAISERROR('Không thể xóa dữ liệu khi còn tồn tại trong bảng Thuốc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;

CREATE TRIGGER tr_CheckDelete_CachDongGoi
ON Cách_đóng_gói
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d
               INNER JOIN Thuốc t ON t.Mã_DG = d.Mã_DG)
    BEGIN
        RAISERROR('Không thể xóa dữ liệu khi còn tồn tại trong bảng Thuốc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;


--Xóa phiếu nhập
CREATE TRIGGER tr_XóaPhiếuNhập
ON Phiếu_Nhập
AFTER DELETE
AS
BEGIN
    DECLARE @Số_PN NVARCHAR(10);
    SELECT @Số_PN = deleted.Số_PN FROM deleted;

    -- Xóa dữ liệu trong bảng Thanh_Toán_PN liên quan đến Mã PN bị xóa
    DELETE FROM Thanh_Toán_PN WHERE Số_PN = @Số_PN;

    -- Xóa dữ liệu trong bảng Chi_tiết_phiếu_nhập liên quan đến Mã PN bị xóa
    DELETE FROM Chi_tiết_phiếu_nhập WHERE Số_PN = @Số_PN;
END;

--Xóa Hóa đơn
CREATE TRIGGER tr_XóaHóaĐơn
ON Hóa_Đơn
AFTER DELETE
AS
BEGIN
    DECLARE @Số_HD NVARCHAR(10);
    SELECT @Số_HD = deleted.Số_HD FROM deleted;

    -- Xóa dữ liệu trong bảng Thanh_Toán_HD liên quan đến Số HD bị xóa
    DELETE FROM Thanh_Toán_HD WHERE Số_HD = @Số_HD;

    -- Xóa dữ liệu trong bảng Chi_tiết_hóa_đơn liên quan đến Số HD bị xóa
    DELETE FROM Chi_tiết_hóa_đơn WHERE Số_HD = @Số_HD;
END;
