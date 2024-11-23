//
//  NetworkError.swift
//  Network
//
//  Created by Cem Ege on 22.11.2024.
//

public struct NetworkError: Error {
    public let type: NetworkErrorType
    public let message: String
    
    public init(type: NetworkErrorType, message: String) {
        self.type = type
        self.message = message
    }
}

public enum NetworkErrorType: Int, Sendable {
    /// - badRequest: The server cannot or will not process the request due to an apparent client error.
    case badRequest = 400
    
    /// - unauthorized: Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.
    case unauthorized = 401
    
    /// - paymentRequired: The content available on the server requires payment.
    case paymentRequired = 402
    
    /// - forbidden: The request was a valid request, but the server is refusing to respond to it.
    case forbidden = 403
    
    /// - notFound: The requested resource could not be found but may be available in the future.
    case notFound = 404
    
    /// - methodNotAllowed: A request method is not supported for the requested resource. e.g. a GET request on a form which requires data to be presented via POST
    case methodNotAllowed = 405
    
    /// - notAcceptable: The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.
    case notAcceptable = 406
    
    /// - proxyAuthenticationRequired: The client must first authenticate itself with the proxy.
    case proxyAuthenticationRequired = 407
    
    /// - requestTimeout: The server timed out waiting for the request.
    case requestTimeout = 408
    
    /// - conflict: Indicates that the request could not be processed because of conflict in the request, such as an edit conflict between multiple simultaneous updates.
    case conflict = 409
    
    /// - gone: Indicates that the resource requested is no longer available and will not be available again.
    case gone = 410
    
    /// - lengthRequired: The request did not specify the length of its content, which is required by the requested resource.
    case lengthRequired = 411
    
    /// - preconditionFailed: The server does not meet one of the preconditions that the requester put on the request.
    case preconditionFailed = 412
    
    /// - payloadTooLarge: The request is larger than the server is willing or able to process.
    case payloadTooLarge = 413
    
    /// - URITooLong: The URI provided was too long for the server to process.
    case URITooLong = 414
    
    /// - unsupportedMediaType: The request entity has a media type which the server or resource does not support.
    case unsupportedMediaType = 415
    
    /// - rangeNotSatisfiable: The client has asked for a portion of the file (byte serving), but the server cannot supply that portion.
    case rangeNotSatisfiable = 416
    
    /// - expectationFailed: The server cannot meet the requirements of the Expect request-header field.
    case expectationFailed = 417
    
    /// - teapot: This HTTP status is used as an Easter egg in some websites.
    case teapot = 418
    
    /// - misdirectedRequest: The request was directed at a server that is not able to produce a response.
    case misdirectedRequest = 421
    
    /// - unprocessableEntity: The request was well-formed but was unable to be followed due to semantic errors.
    case unprocessableEntity = 422
    
    /// - locked: The resource that is being accessed is locked.
    case locked = 423
    
    /// - failedDependency: The request failed due to failure of a previous request (e.g., a PROPPATCH).
    case failedDependency = 424
    
    /// - upgradeRequired: The client should switch to a different protocol such as TLS/1.0, given in the Upgrade header field.
    case upgradeRequired = 426
    
    /// - preconditionRequired: The origin server requires the request to be conditional.
    case preconditionRequired = 428
    
    /// - tooManyRequests: The user has sent too many requests in a given amount of time.
    case tooManyRequests = 429
    
    /// - requestHeaderFieldsTooLarge: The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.
    case requestHeaderFieldsTooLarge = 431
    
    /// - noResponse: Used to indicate that the server has returned no information to the client and closed the connection.
    case noResponse = 444
    
    /// - unavailableForLegalReasons: A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.
    case unavailableForLegalReasons = 451
    
    /// - SSLCertificateError: An expansion of the 400 Bad Request response code, used when the client has provided an invalid client certificate.
    case SSLCertificateError = 495
    
    /// - SSLCertificateRequired: An expansion of the 400 Bad Request response code, used when a client certificate is required but not provided.
    case SSLCertificateRequired = 496
    
    /// - HTTPRequestSentToHTTPSPort: An expansion of the 400 Bad Request response code, used when the client has made a HTTP request to a port listening for HTTPS requests.
    case HTTPRequestSentToHTTPSPort = 497
    
    /// - clientClosedRequest: Used when the client has closed the request before the server could send a response.
    case clientClosedRequest = 499
    
    /// - internalServerError: A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
    case internalServerError = 500
    
    /// - notImplemented: The server either does not recognize the request method, or it lacks the ability to fulfill the request.
    case notImplemented = 501
    
    /// - badGateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.
    case badGateway = 502
    
    /// - serviceUnavailable: The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
    case serviceUnavailable = 503
    
    /// - gatewayTimeout: The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
    case gatewayTimeout = 504
    
    /// - HTTPVersionNotSupported: The server does not support the HTTP protocol version used in the request.
    case HTTPVersionNotSupported = 505
    
    /// - variantAlsoNegotiates: Transparent content negotiation for the request results in a circular reference.
    case variantAlsoNegotiates = 506
    
    /// - insufficientStorage: The server is unable to store the representation needed to complete the request.
    case insufficientStorage = 507
    
    /// - loopDetected: The server detected an infinite loop while processing the request.
    case loopDetected = 508
    
    /// - notExtended: Further extensions to the request are required for the server to fulfill it.
    case notExtended = 510
    
    /// - networkAuthenticationRequired: The client needs to authenticate to gain network access.
    case networkAuthenticationRequired = 511
    
    case decodingFailed
    
    case unknown
}

// MARK: - DecodingErrorHandling
extension NetworkError {
    static func handleDecodingError(error: DecodingError) -> NetworkError {
        switch error {
        case .typeMismatch(let type, let context):
            debugPrint("Type \(type) mismatch: \(context.debugDescription)")
            debugPrint("codingPath: \(context.codingPath)")
            
        case .valueNotFound(_, let context):
            debugPrint("Value Not Found: \(context.debugDescription)")
            
        case .keyNotFound(let codingKey, let context):
            debugPrint("Coding Key Not Found: \(context.debugDescription)")
            debugPrint("codingKey: \(codingKey)")
            
        case .dataCorrupted(let context):
            debugPrint("Data Corrupted: \(context.debugDescription)")
            debugPrint("underlyingError: \(String(describing: context.underlyingError))")
            
        default:
            debugPrint("Unknown Error: \(error.localizedDescription)")
        }
        
        return NetworkError(type: .decodingFailed, message: error.localizedDescription)
    }
}
