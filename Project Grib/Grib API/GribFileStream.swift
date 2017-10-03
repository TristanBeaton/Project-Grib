//
//  GribFileStream.swift
//  Project Grib
//
//  Created by Tristan Beaton on 18/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

typealias Byte = UInt8
typealias ByteArray = Array<Byte>

class GribFileStream {
    
    // MARK: - Properties
    private var stream: InputStream
    private var bits = Array<UInt8>()
    
    var hasBytesAvailable: Bool { return self.stream.hasBytesAvailable }
    
    // MARK: - Initialisers
    init(data:Data) {
        self.stream = InputStream(data: data)
        self.stream.open()
    }
    
    deinit { self.stream.close() }
    
    // MARK: - Bits and Bytes
    private func loadBitBuffer() throws {
        let byte = try self.readByte()
        for i in 0 ..< 8 { self.bits.append((byte << UInt8(i)) >> 7) }
    }
    
    func readBit() throws -> UInt8 {
        if self.bits.count == 0 { try self.loadBitBuffer() }
        let bit = self.bits[0]
        self.bits.removeFirst()
        return bit
    }
    
    func readBits(_ length:Int) throws -> UInt {
        var value = UInt()
        for _ in 0 ..< length { value = value << 1 | UInt(try self.readBit()) }
        return value
    }
    
    private func readByte() throws -> Byte {
        if self.stream.hasBytesAvailable {
            var buffer = UInt8()
            let response = self.stream.read(&buffer, maxLength: MemoryLayout<UInt8>.size)
            switch response {
                case 0: throw GribFileStreamError.EndOfFile
                case -1: throw self.stream.streamError ?? GribFileStreamError.Unknown
                default: break
            }
            return buffer
        }
        throw GribFileStreamError.EndOfFile
    }
    
    private func readBytes(_ length:Int) throws -> ByteArray {
        if self.stream.hasBytesAvailable {
            var buffer = Array<UInt8>(repeating: 0, count: length)
            let response = self.stream.read(&buffer, maxLength: MemoryLayout<UInt8>.size * length)
            switch response {
                case 0: throw GribFileStreamError.EndOfFile
                case -1: throw self.stream.streamError ?? GribFileStreamError.Unknown
                default: break
            }
            return buffer
        }
        throw GribFileStreamError.EndOfFile
    }
    
    // MARK: - Unsigned Integers
    func readUI8() throws -> UInt8 {
        if self.bits.count == 0 { return try self.readByte() }
        return UInt8(try self.readBits(8))
    }

    func readUI8(_ length:Int) throws -> Array<UInt8> {
        var bytes = Array<UInt8>()
        for _ in 0 ..< length { bytes.append(try self.readUI8()) }
        return bytes
    }
    
    func readUI16() throws -> UInt16 {
        if self.bits.count == 0 {
            let bytes = try self.readBytes(2).map { UInt16($0) }
            return bytes[0] << 8 | bytes[1]
        }
        return UInt16(try self.readBits(16))
    }
    
    func readUI32() throws -> UInt32 {
        if self.bits.count == 0 {
            let bytes = try self.readBytes(4).map { UInt32($0) }
            return bytes[0] << 24 | bytes[1] << 16  | bytes[2] << 8  | bytes[3]
        }
        return UInt32(try self.readBits(32))
    }
    
    func readUI64() throws -> UInt64 {
        if self.bits.count == 0 {
            let bytes = try self.readBytes(8).map { UInt64($0) }
            return bytes[0] << 56 | bytes[1] << 48 | bytes[2] << 40 | bytes[3] << 32 | bytes[4] << 24 | bytes[5] << 16 | bytes[6] << 8 | bytes[7]
        }
        return UInt64(try self.readBits(64))
    }
    
    // MARK: - Signed Bytes !!!! This may be incorrect !!!!
    private func readInt(_ length:Int) throws -> Array<Int> {
        let bytes = try self.readUI8(length)
        return bytes.map{ return Int($0) }
//        return try self.readUI8(length).map{ return Int($0) }
    }
    
    func readInt8() throws -> Int8 {
        return Int8(try self.readByte())
    }
//    These only seem to work with positive numbers
//    func readInt16() throws -> Int16 {
//        let data = Array(try self.readUI8(2).reversed())
//        return data.withUnsafeBytes { $0.baseAddress!.load(as: Int16.self) }
//    }
//
//    func readInt32() throws -> Int32 {
//        let data = Array(try self.readUI8(4).reversed())
//        return data.withUnsafeBytes { $0.baseAddress!.load(as: Int32.self) }
//    }
//
//    func readInt64() throws -> Int64 {
//        let data = Array(try self.readUI8(8).reversed())
//        return data.withUnsafeBytes { $0.baseAddress!.load(as: Int64.self) }
//    }
    
    // I'm not sure if all these methods are correct, but they seem to work.
    func readInt16() throws -> Int16 {
        let data = try self.readInt(2)
        var value = 1 - ((data[0] & 128) >> 6)
        value *= (data[0] & 127) << 8 | data[1]
        return Int16(value)
    }
    
    func readInt32() throws -> Int32 {
        let data = try self.readInt(4)
        var value = 1 - ((data[0] & 128) >> 6)
        value *= (data[0] & 127) << 24 | data[1] << 16 | data[2] << 8 | data[3]
        return Int32(value)
    }
    
    func readInt64() throws -> Int64 {
        let data = try self.readInt(8).map{ Int64($0) }
        var value = 1 - ((data[0] & 128) >> 6)
        value *= (data[0] & 127) << 56 | data[1] << 48 | data[2] << 40 | data[3] << 32 | data[4] << 24 | data[5] << 16 | data[6] << 8 | data[7]
        return Int64(value)
    }
    
    // MARK: - Floating Points
    func readFloat() throws -> Float32 {
        var f:Float32 = 0.0
        memcpy(&f, try self.readUI8(4).reversed(), 4)
        return f
    }
    
    // MARK: - Strings
    func readString(_ length:Int) throws -> String {
        var bytes = Array<UInt8>()
        for _ in 0 ..< length { bytes.append(UInt8(try self.readBits(8))) }
        if let str = String(bytes: bytes, encoding: .utf8) { return str }
        throw GribFileStreamError.InvalidString
    }
    
    // MARK: - Bool
    func readBool() throws -> Bool {
        if try self.readInt8() == 0 { return false }
        return true
    }
    
    // MARK: - Offset Tools
    func moveToStart() throws -> Bool {
        let grib = "GRIB".utf8.map { UInt8($0) }
        var data:UInt8 = 0
        while stream.hasBytesAvailable {
            data = try self.readUI8()
            // Check if this is a 'G'
            if data == grib[0] {
                // If so, see if the next values are 'RIB'
                let arr = [try self.readUI8(), try self.readUI8(), try self.readUI8()]
                if arr[0] == grib[1] && arr[1] == grib[2] && arr[2] == grib[3] { return true }
            }
        }
        return false
    }
    
    func skip(_ length:Int) throws {
        for _ in 0 ..< length { let _ = try self.readUI8() }
    }
}
