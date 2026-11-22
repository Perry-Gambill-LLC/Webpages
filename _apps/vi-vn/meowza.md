---
# Vietnamese translation of _apps/meowza.md. Every other setting (icon,
# App Store link, support email, ...) comes from the English page.
# source_hash records which version of the English page this translates;
# see "Translations" in README.md before changing it.
tagline: Trò chuyện với Mr. Whiskers, một chú mèo bạn đồng hành AI thân thiện luôn nhớ những cuộc trò chuyện của bạn.
description: Hỗ trợ và Chính sách quyền riêng tư của ứng dụng Meowza do Perry & Gambill LLC phát triển.
privacy_effective_date: ngày 3 tháng 8 năm 2026
source_hash: 1baa80c483fd
---
{%- assign source = site.apps | where: "slug", page.slug | where: "lang", site.lang | first -%}
{%- assign email = source.support_email | default: site.email -%}

## 1. Giới thiệu {#introduction}

Chào mừng bạn. Chính sách quyền riêng tư này giải thích cách Perry & Gambill LLC ("chúng tôi") thu thập, sử dụng, tiết lộ và bảo vệ thông tin của bạn khi bạn sử dụng Meowza ("Ứng dụng"), một người bạn đồng hành trò chuyện được hỗ trợ bởi AI. Vui lòng đọc kỹ chính sách này. Nếu bạn không đồng ý với các điều khoản của chính sách, vui lòng ngừng sử dụng Ứng dụng.

Chúng tôi có quyền thay đổi Chính sách quyền riêng tư này vào bất cứ lúc nào. Chúng tôi sẽ thông báo cho bạn về những thay đổi quan trọng bằng cách cập nhật ngày "Cập nhật lần cuối" ở trên và, khi phù hợp, qua thông báo trong ứng dụng hoặc email.

## 2. Thông tin chúng tôi thu thập {#information-we-collect}

### 2.1 Thông tin bạn trực tiếp cung cấp {#information-you-provide-directly}

- **Thông tin tài khoản:** Tên, địa chỉ email và thông tin đăng nhập khi bạn đăng ký.
- **Dữ liệu hồ sơ:** Các thông tin hồ sơ không bắt buộc mà bạn chọn cung cấp, bao gồm ngày sinh của bạn (dùng để cá nhân hóa trải nghiệm với người bạn đồng hành, chẳng hạn như nhận biết sinh nhật của bạn).
- **Tin nhắn trò chuyện:** Những tin nhắn bạn gửi cho người bạn đồng hành AI. Các tin nhắn này được lưu trữ ở dạng mã hóa bằng chuẩn mã hóa AES-256-GCM và được dùng để tạo phản hồi AI và duy trì tính liên tục của cuộc trò chuyện.
- **Thông tin liên lạc:** Phản hồi hoặc yêu cầu hỗ trợ mà bạn gửi cho chúng tôi.
- **Thông tin thanh toán:** Nếu có, tên thanh toán, địa chỉ và thông tin phương thức thanh toán (được các đơn vị xử lý thanh toán bên thứ ba xử lý an toàn — chúng tôi không lưu trữ đầy đủ số thẻ).

### 2.2 Thông tin được thu thập tự động {#information-collected-automatically}

- **Dữ liệu sử dụng:** Các tính năng đã truy cập, thao tác đã thực hiện, thời lượng phiên và tần suất sử dụng.
- **Thông tin thiết bị:** Loại thiết bị, hệ điều hành, loại và phiên bản trình duyệt, mã nhận dạng thiết bị duy nhất.
- **Dữ liệu nhật ký:** Địa chỉ IP, dấu thời gian truy cập, nhật ký lỗi và URL giới thiệu.
- **Cookie và công nghệ theo dõi:** Chúng tôi sử dụng cookie, web beacon và các công nghệ tương tự để duy trì phiên và phân tích xu hướng sử dụng.

### 2.3 Thông tin từ bên thứ ba {#information-from-third-parties}

- **Nhà cung cấp OAuth:** Nếu bạn đăng nhập qua Apple, chúng tôi nhận được thông tin hồ sơ cơ bản (tên, email) trong phạm vi cài đặt của bạn với nhà cung cấp đó cho phép.
- **Đối tác phân tích:** Số liệu thống kê sử dụng đã được tổng hợp và ẩn danh hóa từ các dịch vụ phân tích.

## 3. Cách chúng tôi sử dụng thông tin của bạn {#how-we-use-your-information}

Chúng tôi sử dụng thông tin thu thập được để:

- **Cung cấp và vận hành** Ứng dụng và các tính năng của Ứng dụng.
- **Xác thực** danh tính của bạn và duy trì các phiên an toàn.
- **Tạo phản hồi AI:** Tin nhắn trò chuyện và ngữ cảnh hồ sơ của bạn được gửi đến một mô hình AI của bên thứ ba (OpenAI API) để tạo phản hồi của người bạn đồng hành. Nội dung tin nhắn được truyền tải an toàn và không được dùng để huấn luyện mô hình AI.
- **Duy trì bộ nhớ hội thoại:** Chúng tôi lưu một bản tóm tắt nén của các cuộc trò chuyện trước đây để người bạn đồng hành có thể nhớ ngữ cảnh qua các phiên. Bản tóm tắt này được lưu trữ ở dạng mã hóa.
- **Cá nhân hóa** trải nghiệm của bạn dựa trên hồ sơ và lịch sử trò chuyện của bạn.
- **Xử lý giao dịch** và gửi các xác nhận và biên lai liên quan.
- **Gửi thông báo đẩy** để báo cho bạn khi người bạn đồng hành đã trả lời.
- **Liên lạc** với bạn về các bản cập nhật, tính năng mới, cảnh báo bảo mật và hỗ trợ.
- **Cải thiện Ứng dụng** thông qua phân tích, theo dõi lỗi và nghiên cứu người dùng.
- **Thực thi Điều khoản dịch vụ** của chúng tôi và bảo vệ tính bảo mật và toàn vẹn của Ứng dụng.
- **Tuân thủ nghĩa vụ pháp lý** và phản hồi các yêu cầu hợp pháp của cơ quan nhà nước.

Chúng tôi không bán thông tin cá nhân của bạn cho bên thứ ba.

## 4. Cơ sở pháp lý cho việc xử lý (GDPR) {#legal-bases-for-processing-gdpr}

Nếu bạn ở Khu vực Kinh tế Châu Âu (EEA) hoặc Vương quốc Anh, cơ sở pháp lý để chúng tôi xử lý dữ liệu cá nhân của bạn là:

- **Sự cần thiết theo hợp đồng:** Tạo tài khoản, cung cấp chức năng cốt lõi của ứng dụng.
- **Lợi ích hợp pháp:** Giám sát bảo mật, phòng chống gian lận, cải thiện sản phẩm.
- **Nghĩa vụ pháp lý:** Hồ sơ thuế, phản hồi các yêu cầu hợp pháp.
- **Sự đồng ý:** Email tiếp thị, phân tích không bắt buộc.

Bạn có thể rút lại sự đồng ý vào bất cứ lúc nào trong những trường hợp chúng tôi dựa vào sự đồng ý đó, mà không ảnh hưởng đến tính hợp pháp của việc xử lý trước đó.

## 5. Chia sẻ thông tin của bạn {#sharing-your-information}

Chúng tôi có thể chia sẻ thông tin của bạn với:

- **Nhà cung cấp dịch vụ:** Các nhà cung cấp bên thứ ba đáng tin cậy hỗ trợ vận hành Ứng dụng, bao gồm Amazon Web Services (hạ tầng đám mây và thông báo đẩy qua Amazon SNS), OpenAI (suy luận mô hình AI), Apple (xác thực và xử lý thanh toán) và các nhà cung cấp dịch vụ phân tích. Các bên này bị ràng buộc theo hợp đồng phải bảo vệ dữ liệu của bạn. Tin nhắn trò chuyện được truyền đến OpenAI chỉ để tạo phản hồi AI và không được OpenAI lưu giữ cho mục đích huấn luyện mô hình theo thỏa thuận dịch vụ của chúng tôi.
- **Chuyển giao doanh nghiệp:** Trong trường hợp sáp nhập, mua lại hoặc bán tài sản, dữ liệu của bạn có thể được chuyển giao. Chúng tôi sẽ thông báo trước khi dữ liệu của bạn chịu sự điều chỉnh của một chính sách quyền riêng tư khác.
- **Yêu cầu pháp lý:** Khi pháp luật, lệnh của tòa án hoặc cơ quan nhà nước yêu cầu, hoặc để bảo vệ quyền, tài sản hoặc sự an toàn của người dùng của chúng tôi hoặc công chúng.
- **Khi có sự đồng ý của bạn:** Trong bất kỳ trường hợp nào khác mà bạn đã cho phép tiết lộ một cách rõ ràng.

## 6. Lưu giữ dữ liệu {#data-retention}

Chúng tôi lưu giữ thông tin cá nhân của bạn chừng nào tài khoản của bạn còn hoạt động hoặc khi cần thiết để cung cấp dịch vụ. Bạn có thể yêu cầu xóa tài khoản của mình vào bất cứ lúc nào (xem Mục 8). Sau khi xóa, chúng tôi có thể lưu giữ một số dữ liệu ở dạng ẩn danh hoặc tổng hợp, hoặc khi pháp luật yêu cầu, trong thời gian không quá **90 ngày** kể từ khi bạn yêu cầu.

## 7. Bảo mật dữ liệu {#data-security}

Chúng tôi áp dụng các biện pháp kỹ thuật và tổ chức theo tiêu chuẩn ngành để bảo vệ thông tin của bạn, bao gồm:

- Mã hóa dữ liệu khi truyền (TLS/HTTPS) và khi lưu trữ (mã hóa phong bì AES-256-GCM qua AWS KMS cho toàn bộ tin nhắn trò chuyện và bản tóm tắt cuộc trò chuyện).
- Kiểm soát truy cập, chỉ cho phép nhân sự được ủy quyền truy cập dữ liệu.
- Kiểm tra bảo mật và đánh giá lỗ hổng định kỳ.

Không có phương thức truyền tải qua internet hay lưu trữ điện tử nào an toàn 100%. Mặc dù chúng tôi cố gắng sử dụng các phương tiện được chấp nhận về mặt thương mại để bảo vệ dữ liệu của bạn, chúng tôi không thể đảm bảo an toàn tuyệt đối.

## 8. Quyền và lựa chọn của bạn {#your-rights-and-choices}

Tùy theo nơi bạn sinh sống, bạn có thể có các quyền sau:

- **Truy cập:** Yêu cầu bản sao dữ liệu cá nhân mà chúng tôi lưu giữ về bạn.
- **Chỉnh sửa:** Yêu cầu chỉnh sửa dữ liệu không chính xác hoặc chưa đầy đủ.
- **Xóa:** Yêu cầu xóa dữ liệu cá nhân của bạn ("quyền được lãng quên").
- **Chuyển dữ liệu:** Nhận dữ liệu của bạn ở định dạng có cấu trúc, máy có thể đọc được.
- **Phản đối:** Phản đối việc xử lý dựa trên lợi ích hợp pháp.
- **Hạn chế:** Yêu cầu chúng tôi hạn chế xử lý dữ liệu của bạn trong một số trường hợp nhất định.
- **Từ chối nhận tiếp thị:** Hủy đăng ký nhận email quảng cáo qua liên kết trong bất kỳ email nào hoặc trong phần cài đặt tài khoản của bạn.

Để thực hiện bất kỳ quyền nào trong số này, hãy liên hệ với chúng tôi theo địa chỉ ở Mục 11. Chúng tôi sẽ phản hồi trong vòng **30 ngày**.

## 9. Quyền riêng tư của trẻ em {#childrens-privacy}

Ứng dụng không hướng đến trẻ em dưới **13** tuổi (hoặc **16** tuổi ở EEA). Chúng tôi không cố ý thu thập thông tin cá nhân từ trẻ em. Nếu chúng tôi biết rằng mình đã vô tình thu thập dữ liệu từ một trẻ em dưới độ tuổi áp dụng, chúng tôi sẽ có biện pháp xóa dữ liệu đó ngay lập tức. Nếu bạn cho rằng một trẻ em đã cung cấp thông tin cá nhân cho chúng tôi, vui lòng liên hệ với chúng tôi ngay.

## 10. Liên kết và dịch vụ của bên thứ ba {#third-party-links-and-services}

Ứng dụng có thể chứa liên kết đến các trang web của bên thứ ba hoặc tích hợp với các dịch vụ của bên thứ ba. Chính sách quyền riêng tư này không áp dụng cho các dịch vụ bên ngoài đó. Chúng tôi khuyến khích bạn xem lại chính sách quyền riêng tư của bất kỳ dịch vụ bên thứ ba nào mà bạn truy cập thông qua Ứng dụng.

## 11. Liên hệ với chúng tôi {#contact-us}

Nếu bạn có câu hỏi, thắc mắc hoặc yêu cầu liên quan đến Chính sách quyền riêng tư này, vui lòng liên hệ với chúng tôi qua [{{ email }}](mailto:{{ email }}).

Nếu bạn ở EEA và cho rằng chúng tôi chưa giải quyết thỏa đáng mối quan ngại của bạn, bạn có quyền khiếu nại với cơ quan bảo vệ dữ liệu tại địa phương.

## 12. Thay đổi đối với chính sách này {#changes-to-this-policy}

Chúng tôi có thể cập nhật Chính sách quyền riêng tư này theo định kỳ. Khi đó, chúng tôi sẽ sửa ngày "Cập nhật lần cuối" ở đầu trang này. Đối với những thay đổi quan trọng, chúng tôi sẽ thông báo rõ ràng hơn (chẳng hạn như qua biểu ngữ trong ứng dụng hoặc thông báo qua email). Việc bạn tiếp tục sử dụng Ứng dụng sau khi các thay đổi có hiệu lực đồng nghĩa với việc bạn chấp nhận chính sách đã sửa đổi.

*Chính sách quyền riêng tư này được cập nhật lần cuối vào ngày 17 tháng 5 năm 2026.*
